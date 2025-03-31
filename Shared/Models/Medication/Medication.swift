//
//  Medication.swift.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/31/25.
//


import Foundation

struct Medication: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var dosage: String? // Optional, or remove if you're not using it
    var frequency: String? // Optional — e.g., "daily", "twice daily"
}
