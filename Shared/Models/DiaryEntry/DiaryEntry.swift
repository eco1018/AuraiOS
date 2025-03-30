//
//  DiaryEntry.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

/// Represents one full diary card entry submitted by the user on a specific day.
/// Includes tracked preferences, daily note, and submission timestamp.
struct DiaryEntry: Codable, Identifiable {
    var id: String = UUID().uuidString
    
    // MARK: - Timestamp
    var date: Date                          // The day this diary entry was submitted
    
    // MARK: - Tracked DBT Behaviors (Daily)
    var actions: [ActionSubmission]         // Yes/No: Did the behavior occur?
    var urges: [UrgeSubmission]             // 0–10 intensity per urge
    var goals: [GoalSubmission]             // Yes/No: Did the user complete each goal?
    var tookMedications: Bool?             // Optional Yes/No: "Did you take your meds?" (if enabled)
    
    // MARK: - Freeform Reflection
    var diaryNote: String                   // ✅ The user’s written journal entry
    
    // MARK: - Metadata
    var createdAt: Date                     // Exact time of submission
}
