

//
//  OnboardingCoordinator+Extensions.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

extension OnboardingCoordinator {
    
    func asPartialUserProfile(userID: String) -> UserProfile {
        let now = Date()
        
        return UserProfile(
            id: userID,
            identity: UserIdentity(
                id: userID,
                firstName: self.firstName,
                lastName: self.lastName,
                email: "", // Fill from Firebase later
                gender: nil,
                birthdate: self.birthdate,
                createdAt: now,
                lastUpdated: now,
                consentedToAnalytics: false
            ),
            actions: self.actions,
            urges: self.urges,
            goals: self.goals,
            takesMedications: self.takesMedications,
            medications: self.medications,
            notificationPreferences: self.notificationPreference,
            hasCompletedOnboarding: false,
            consentedToAnalytics: false,
            createdAt: now,
            lastUpdated: now
        )
    }
}
