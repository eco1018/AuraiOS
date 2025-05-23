//
//  AppServices.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

/// Global shared services used throughout the app.
enum AppServices {
    
    // MARK: - Live Firebase Services
    
    static let authService: AuthServiceProtocol = FirebaseAuthService()
    static let userProfileService: UserProfileServiceProtocol = FirestoreUserProfileService()
    static let onboardingService: OnboardingServiceProtocol = FirestoreOnboardingService()
    static let diaryCardService: DiaryCardServiceProtocol = DiaryCardService() // ✅ Added

    // MARK: - Future Services
    // static let notificationService: NotificationServiceProtocol = ...
    
    // Add more services as your app grows
}
