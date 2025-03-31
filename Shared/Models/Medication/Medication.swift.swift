//
//  Medication.swift.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/31/25.
//

// Medication.swift
import Foundation

struct Medication: Codable, Identifiable {
    var id: String = UUID().uuidString   // Unique identifier
    var name: String                     // The name of the medication
}
