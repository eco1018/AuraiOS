//
//  UserProfile.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents the full user profile stored in Firestore.
/// Includes identity, DBT preferences, onboarding state, reminders, and metadata.
struct UserProfile: Codable, Identifiable {
    
    // MARK: - Identity
    
    var id: String                      // Matches Firebase UID
    var identity: UserIdentity         // User's name, age, email, etc.
    
    // MARK: - Selected DBT Preferences
    
    var actions: [ActionPreference]    // User-selected actions (excludes fixed)
    var urges: [UrgePreference]        // User-selected urges (excludes fixed)
    var goals: [GoalPreference]        // User-selected daily goals (up to 3)
    
    // MARK: - Medication Tracking
    
    var takesMedications: Bool         // Onboarding flag: Do they take medications?
    var medications: [Medication]?    // User Medications
    
    // MARK: - Notification Reminders
    
    var notificationPreferences: NotificationPreference
    
    // MARK: - Onboarding & App State
    
    var hasCompletedOnboarding: Bool   // Used to route in RootView
    
    // MARK: - Consent Flags
    
    var consentedToAnalytics: Bool     // Explicit consent for behavioral analytics
    
    // MARK: - Metadata
    
    var createdAt: Date                // Timestamp of profile creation
    var lastUpdated: Date              // Last updated time (useful for syncing)
}
