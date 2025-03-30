//
//  NotificationPreference.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

/// Stores the user’s daily reminder settings for completing the DBT Diary Card.
/// Supports once or twice daily reminders (e.g., morning and evening).
struct NotificationPreference: Codable, Identifiable {
    
    var id: String = UUID().uuidString
    
    // MARK: - Diary Card Reminders
    
    /// Whether the user wants one or two reminders per day.
    var frequency: ReminderFrequency
    
    /// The selected morning reminder time (if applicable).
    var morningReminderTime: DateComponents?
    
    /// The selected evening reminder time (if applicable).
    var eveningReminderTime: DateComponents?
    
    // MARK: - Future Reminders (e.g., Medications, Skills)

    // var medicationReminderTime: DateComponents?
    // var customReminders: [CustomReminder]?

    // MARK: - Metadata
    
    var createdAt: Date
    var lastUpdated: Date
}
