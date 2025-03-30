//
//  MedicationStatus.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents a user’s medication intake status for a specific day.
/// Used for simple Yes/No tracking on the Diary Card.
struct MedicationStatus: Codable, Identifiable {
    var id: String = UUID().uuidString
    var tookMedications: Bool          // "Did you take your medications today?"
    var date: Date                     // The date this answer applies to
}
