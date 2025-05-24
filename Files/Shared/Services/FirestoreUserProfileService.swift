//
//  FirestoreUserProfileService.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation
import FirebaseFirestore


struct FirestoreUserProfileService: UserProfileServiceProtocol {
    
    func loadUserProfile(for userID: String) async throws -> UserProfile {
        let ref = FirestorePathHelper.userProfileDocument(for: userID)
        return try await ref.getDocument(as: UserProfile.self)
    }
    
    func saveUserProfile(_ profile: UserProfile, for userID: String) async throws {
        let ref = FirestorePathHelper.userProfileDocument(for: userID)
        try ref.setData(from: profile, merge: true)
    }
}
