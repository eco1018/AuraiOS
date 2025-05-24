//
//  UserIdentity.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

struct UserIdentity: Codable, Identifiable {
    var id: String                    // Firebase UID
    var firstName: String
    var lastName: String
    var email: String
    var gender: String?
    var birthdate: Date

    var createdAt: Date
    var lastUpdated: Date
    var consentedToAnalytics: Bool    // ✅ Ethical flag

    var age: Int {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.year], from: birthdate, to: now)
        return components.year ?? 0
    }
}
