//
//  FirestoreOnboardingService.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation
import FirebaseFirestore

struct FirestoreOnboardingService: OnboardingServiceProtocol {
    
    func saveUserProfile(_ profile: UserProfile, for userID: String) async throws {
        let ref = FirestorePathHelper.userProfileDocument(for: userID)
        try ref.setData(from: profile, merge: true)
    }
}
