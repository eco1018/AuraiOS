//
//  EmotionRating.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents a single emotion rating on a 0–10 scale during a diary card check-in.
/// Optimized for AI/ML time-series modeling and pattern tracking.
struct EmotionRating: Codable, Identifiable {
    var id: String             // "joy", "anger", etc. (unique per emotion type)
    var value: Int             // 0–10 scale (user-selected)
    var timestamp: Date        // When the emotion was recorded
    
    // 🔁 AI/ML metadata
    var userID: String         // The user who submitted this rating
    var entryID: String        // The diary entry this belongs to

    /// Standard display label
    var label: String {
        switch id {
        case "joy": return "Joy"
        case "sadness": return "Sadness"
        case "anger": return "Anger"
        case "anxiety": return "Anxiety"
        case "shame": return "Shame"
        case "connection": return "Connection"
        default: return id.capitalized
        }
    }
}
