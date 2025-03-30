//
//  ActionSubmission.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents one action the user marked as occurring (or not) on a specific diary card entry.
struct ActionSubmission: Codable, Identifiable {
    var id: String              // Matches ActionPreference.id
    var title: String           // Copy of the original title at time of submission
    var isFixed: Bool           // True for "Self Harm" and "Suicide"
    var isCustom: Bool          // True if user created this action manually
    var occurred: Bool          // True if the user marked this as occurring on that day
}
