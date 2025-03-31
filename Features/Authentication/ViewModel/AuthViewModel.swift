
//
//  AuthViewModel.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
//
//  AuthViewModel.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    
    // MARK: - Dependencies
    
    private let appCoordinator: AppCoordinator
    private let authService: AuthServiceProtocol
    private let userProfileService: UserProfileServiceProtocol

    // MARK: - Published App State
    
    @Published var isSignedIn: Bool = false
    @Published var userProfile: UserProfile?
    @Published var onboardingStep: OnboardingStep?

    // MARK: - Init
    
    init(
        appCoordinator: AppCoordinator,
        authService: AuthServiceProtocol = FirebaseAuthService(),
        userProfileService: UserProfileServiceProtocol = FirestoreUserProfileService()
    ) {
        self.appCoordinator = appCoordinator
        self.authService = authService
        self.userProfileService = userProfileService
        
        Task {
            await listenToAuthState()
        }
    }
    
    // MARK: - Firebase User
    
    var userID: String? {
        authService.userID
    }

    // MARK: - Sign In
    
    func signIn(email: String, password: String) async throws {
        try await authService.signIn(email: email, password: password)
        if let uid = userID {
            try await loadUserProfile(for: uid)
        }
    }

    // MARK: - Sign Up
    
    func signUp(email: String, password: String, firstName: String, lastName: String, birthdate: Date) async throws {
        let uid = try await authService.signUp(email: email, password: password)
        let now = Date()
        
        let profile = UserProfile(
            id: uid,
            identity: UserIdentity(
                id: uid,
                firstName: firstName,
                lastName: lastName,
                email: email,
                birthdate: birthdate,
                createdAt: now,
                lastUpdated: now,
                consentedToAnalytics: false
            ),
            actions: [],
            urges: [],
            goals: [],
            takesMedications: false,
            medications: [],
            notificationPreferences: NotificationPreference(
                frequency: .oncePerDay,
                morningReminderTime: nil,
                eveningReminderTime: nil,
                createdAt: now,
                lastUpdated: now
            ),
            hasCompletedOnboarding: false,
            consentedToAnalytics: false,
            createdAt: now,
            lastUpdated: now
        )
        
        try await userProfileService.saveUserProfile(profile, for: uid)
        try await loadUserProfile(for: uid)
    }

    // MARK: - Sign Out
    
    func signOut() throws {
        try authService.signOut()
        self.isSignedIn = false
        self.userProfile = nil
        self.onboardingStep = nil
        appCoordinator.resetAppState()
    }

    // MARK: - Auth Listener
    
    private func listenToAuthState() async {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            Task {
                if let user = user {
                    self.isSignedIn = true
                    self.appCoordinator.isLoggedIn = true
                    self.appCoordinator.currentUserID = user.uid
                    try? await self.loadUserProfile(for: user.uid)
                } else {
                    self.isSignedIn = false
                    self.userProfile = nil
                    self.onboardingStep = nil
                    self.appCoordinator.resetAppState()
                }
            }
        }
    }

    // MARK: - Profile Loading & Updates
    
    func loadUserProfile(for userID: String) async throws {
        let profile = try await userProfileService.loadUserProfile(for: userID)
        self.userProfile = profile
        self.onboardingStep = profile.hasCompletedOnboarding ? nil : .welcome
        self.appCoordinator.hasCompletedOnboarding = profile.hasCompletedOnboarding
    }

    func updateUserProfile(_ updatedProfile: UserProfile) async {
        let uid = updatedProfile.id
        
        do {
            try await userProfileService.saveUserProfile(updatedProfile, for: uid)
            self.userProfile = updatedProfile
            self.onboardingStep = updatedProfile.hasCompletedOnboarding ? nil : onboardingStep
            self.appCoordinator.hasCompletedOnboarding = updatedProfile.hasCompletedOnboarding
        } catch {
            print("Failed to update profile: \(error)")
        }
    }
}
