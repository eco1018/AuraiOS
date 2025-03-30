//
//  DiaryEntry.swift
//  Aura_iOS
//
import Foundation

/// Represents one full diary card entry submitted by the user on a specific day.
/// Includes tracked preferences, freeform notes, emotional ratings, and metadata.
struct DiaryEntry: Codable, Identifiable {
    var id: String = UUID().uuidString

    // MARK: - Ownership
    var userID: String                      // Firebase UID of the user

    // MARK: - Timestamp
    var date: Date                          // The calendar day this entry represents
    var timeOfDay: String                   // "Morning" or "Evening"
    var createdAt: Date                     // Exact moment of submission

    // MARK: - Tracked DBT Behaviors (Daily)
    var actions: [ActionSubmission]         // Yes/No: Did the behavior occur?
    var urges: [UrgeSubmission]             // 0–10 intensity per urge
    var goals: [GoalSubmission]             // Yes/No: Did the user complete each goal?
    var emotions: [EmotionRating]           // 0–10 for each of 6 core emotions
    var tookMedications: Bool?              // Optional Yes/No: "Did you take your meds?"

    // MARK: - Freeform Reflection
    var diaryNote: String                   // The user’s written journal entry

    // MARK: - ML / AI Metadata (Optional)
    var moodScore: Double?                  // Future: AI-generated mood score or sentiment tag
}
