//
//  UserProfileServiceProtocol.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

protocol UserProfileServiceProtocol {
    func loadUserProfile(for userID: String) async throws -> UserProfile
    func saveUserProfile(_ profile: UserProfile, for userID: String) async throws
}
