//
//  EmotionRating+Defaults.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

extension EmotionRating {
    static func defaultEmotions(for userID: String, entryID: String) -> [EmotionRating] {
        let timestamp = Date()
        return [
            EmotionRating(id: "joy", value: 0, timestamp: timestamp, userID: userID, entryID: entryID),
            EmotionRating(id: "sadness", value: 0, timestamp: timestamp, userID: userID, entryID: entryID),
            EmotionRating(id: "anger", value: 0, timestamp: timestamp, userID: userID, entryID: entryID),
            EmotionRating(id: "anxiety", value: 0, timestamp: timestamp, userID: userID, entryID: entryID),
            EmotionRating(id: "shame", value: 0, timestamp: timestamp, userID: userID, entryID: entryID),
            EmotionRating(id: "connection", value: 0, timestamp: timestamp, userID: userID, entryID: entryID)
        ]
    }
}
