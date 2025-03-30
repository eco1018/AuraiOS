//
//  GoalPreference.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents a daily goal the user chooses to track in their diary card.
struct GoalPreference: Codable, Identifiable, Equatable {
    var id: String            // Unique ID (e.g., "eat_meal" or UUID for custom)
    var title: String         // Display name (e.g., "Move My Body")
    var description: String   // Supportive explanation
    var isCustom: Bool        // True if user wrote it in manually
}
