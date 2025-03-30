//
//  AuthServiceProtocol.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    var currentUser: User? { get }
    var userID: String? { get }

    func signIn(email: String, password: String) async throws
    func signUp(email: String, password: String) async throws -> String // returns UID
    func signOut() throws
}
