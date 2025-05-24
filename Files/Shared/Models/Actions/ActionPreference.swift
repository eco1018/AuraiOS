//
//  ActionPreference.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//


import Foundation

/// Represents a behavior the user may want to track as part of their DBT diary card.
/// These are selected during onboarding (or updated later in settings).
struct ActionPreference: Codable, Identifiable, Equatable {
    var id: String            // Unique identifier (e.g., "self_harm", or UUID for custom)
    var title: String         // What the user sees (e.g., "Substance Use")
    var description: String   // Short explanation shown to help user understand
    var isFixed: Bool         // True if always-included (e.g., Self Harm, Suicide)
    var isCustom: Bool        // True if created by the user
}
