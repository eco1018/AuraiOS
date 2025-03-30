//
//  FirebaseAuthService.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthService: AuthServiceProtocol {
    
    var currentUser: User? {
        Auth.auth().currentUser
    }
    
    var userID: String? {
        currentUser?.uid
    }

    func signIn(email: String, password: String) async throws {
        _ = try await Auth.auth().signIn(withEmail: email, password: password)
    }

    func signUp(email: String, password: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user.uid
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}
