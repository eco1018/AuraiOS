//
//  DiaryEntry+Extensions.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

extension DiaryEntry {
    
    /// Creates a blank diary entry draft with required metadata
    static func empty(for userID: String, timeOfDay: String) -> DiaryEntry {
        return DiaryEntry(
            id: UUID().uuidString,
            date: Date(),
            timeOfDay: timeOfDay,                     // ✅ NEW
            actions: [],
            urges: [],
            goals: [],
            emotionRatings: [],
            tookMedications: nil,
            diaryNote: "",
            createdAt: Date()
        )
    }
}
