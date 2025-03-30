//
//  OnboardingViewModel.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

@MainActor
final class OnboardingViewModel: ObservableObject {
    
    // MARK: - Dependencies
    
    let onboardingService: OnboardingServiceProtocol
    
    // MARK: - Init
    
    init(onboardingService: OnboardingServiceProtocol) {
        self.onboardingService = onboardingService
    }
    
    // MARK: - Autosave Partial Draft (optional use)
    
    func savePartialProfile(_ coordinator: OnboardingCoordinator, for userID: String) async {
        let draft = coordinator.asPartialUserProfile(userID: userID)
        do {
            try await onboardingService.saveUserProfile(draft, for: userID)
        } catch {
            print("⚠️ Failed to autosave draft onboarding profile: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Final Profile Submission
    
    func completeOnboarding(
        for userID: String,
        using coordinator: OnboardingCoordinator
    ) async throws {
        let now = Date()
        
        let finalProfile = UserProfile(
            id: userID,
            identity: UserIdentity(
                firstName: coordinator.firstName,
                lastName: coordinator.lastName,
                email: "", // You can fill this in from Firebase later
                age: Calendar.current.dateComponents([.year], from: coordinator.birthdate, to: now).year ?? 0
            ),
            actions: coordinator.actions,
            urges: coordinator.urges,
            goals: coordinator.goals,
            takesMedications: coordinator.takesMedications,
            medications: coordinator.medications,
            notificationPreference: coordinator.notificationPreference,
            hasCompletedOnboarding: true,
            consentedToAnalytics: true,
            createdAt: now,
            lastUpdated: now
        )
        
        try await onboardingService.saveUserProfile(finalProfile, for: userID)
    }
}
