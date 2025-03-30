//
//  OnboardingServiceProtocol.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

protocol OnboardingServiceProtocol {
    func saveUserProfile(_ profile: UserProfile, for userID: String) async throws
}
