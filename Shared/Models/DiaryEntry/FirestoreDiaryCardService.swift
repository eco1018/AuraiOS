//
//  FirestoreDiaryCardService.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//


import Foundation
import FirebaseFirestore

struct FirestoreDiaryCardService: DiaryCardServiceProtocol {
    
    private let db = Firestore.firestore()
    
    // MARK: - Save Diary Entry
    func saveDiaryEntry(_ entry: DiaryEntry) async throws {
        let docRef = db
            .collection("users")
            .document(entry.id) // Assuming entry.id == userID. If not, pass userID separately.
            .collection("diaryEntries")
            .document(entry.id)
        
        try docRef.setData(from: entry)
    }

    // MARK: - Load Diary Entries
    func loadDiaryEntries(for userID: String) async throws -> [DiaryEntry] {
        let snapshot = try await db
            .collection("users")
            .document(userID)
            .collection("diaryEntries")
            .order(by: "date", descending: true)
            .getDocuments()
        
        return try snapshot.documents.compactMap {
            try $0.data(as: DiaryEntry.self)
        }
    }
}
