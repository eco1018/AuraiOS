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
                firstName: self.firstName,
                lastName: self.lastName,
                email: "", // Fill from Firebase later
                age: Calendar.current.dateComponents([.year], from: self.birthdate, to: now).year ?? 0
            ),
            actions: self.actions,
            urges: self.urges,
            goals: self.goals,
            takesMedications: self.takesMedications,
            medications: self.medications,
            notificationPreference: self.notificationPreference,
            hasCompletedOnboarding: false, // stays false until wrap-up
            consentedToAnalytics: false,   // can be changed later
            createdAt: now,
            lastUpdated: now
        )
    }
}
