//
//  ReminderFrequency.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents whether the user wants one or two reminders per day.
enum ReminderFrequency: String, Codable {
    case oncePerDay
    case twicePerDay
}
