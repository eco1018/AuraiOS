//
//  UrgePreference.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

/// Represents one tracked urge the user may monitor on their diary card.
struct UrgePreference: Codable, Identifiable, Equatable {
    var id: String            // Unique string ID (e.g., "self_harm" or a UUID for custom)
    var title: String         // Display title (e.g., "Using Substances")
    var description: String   // Safe, nonjudgmental explanation
    var isFixed: Bool         // True for required urges (Suicide, Self Harm, Quit DBT)
    var isCustom: Bool        // True if user typed this in manually
}
