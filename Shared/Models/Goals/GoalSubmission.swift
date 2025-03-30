//
//  GoalSubmission.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

/// Represents a snapshot of a single goal's completion on one diary entry.
struct GoalSubmission: Codable, Identifiable {
    var id: String            // Matches the GoalPreference.id
    var title: String         // Title copied from original preference
    var isCustom: Bool        // Copied from original preference
    var completed: Bool       // Did the user complete it today?
}
