//
//  UrgeSubmission.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

/// Represents a snapshot of a specific urge and its intensity on a single diary card entry.
struct UrgeSubmission: Codable, Identifiable {
    var id: String            // Matches the original UrgePreference.id
    var title: String         // Stored title in case user renames the preference later
    var intensity: Int        // User-selected intensity from 0–10
    var isFixed: Bool         // Copied from original preference
    var isCustom: Bool        // Copied from original preference
}
