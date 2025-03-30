//
//  GoalPreference+Extensions.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

extension GoalPreference {
    
    /// Creates a custom user-written goal with a unique ID.
    static func custom(_ title: String) -> GoalPreference {
        GoalPreference(
            id: UUID().uuidString,
            title: title,
            description: "",
            isCustom: true
        )
    }

    /// Converts the preference into a daily submission snapshot.
    func toSubmission(didComplete: Bool) -> GoalSubmission {
        GoalSubmission(
            id: self.id,
            title: self.title,
            isCustom: self.isCustom,
            completed: didComplete
        )
    }
}

extension Array where Element == GoalPreference {
    
    /// Returns only the user-written custom goals.
    func customOnly() -> [GoalPreference] {
        self.filter { $0.isCustom }
    }

    /// Returns only the predefined goals.
    func predefinedOnly() -> [GoalPreference] {
        self.filter { !$0.isCustom }
    }

    /// Returns the IDs of all goals.
    func goalIDs() -> [String] {
        self.map { $0.id }
    }
}
