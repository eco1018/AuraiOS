//
//  AuthStep.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

enum AuthStep: Codable, Hashable {
    case email
    case signInPassword
    case signUpProfile
    case signUpPassword
    case complete
}
