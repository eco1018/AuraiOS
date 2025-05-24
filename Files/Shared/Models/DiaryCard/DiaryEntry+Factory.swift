
//
//  DiaryEntry+Factory.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

extension DiaryEntry {
    /// Creates an empty diary entry with default structure for a specific user and time of day.
    static func empty(for userID: String, timeOfDay: String) -> DiaryEntry {
        let id = UUID().uuidString
        let now = Date()

        return DiaryEntry(
            id: id,
            userID: userID,
            date: now,
            timeOfDay: timeOfDay,
            actions: [],
            urges: [],
            goals: [],
            emotionRatings: EmotionRating.defaultEmotions(for: userID, entryID: id),
            tookMedications: nil,
            diaryNote: "",
//            moodScore: nil,
            createdAt: now
        )
    }
}
