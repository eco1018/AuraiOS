//
//  DiaryCardService.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation
import FirebaseFirestore

struct DiaryCardService: DiaryCardServiceProtocol {
    
    private let db = Firestore.firestore()

    // MARK: - Firestore Path
    
    private func diaryCollection(for userID: String) -> CollectionReference {
        db.collection("users")
          .document(userID)
          .collection("diaryEntries")
    }

    // MARK: - Save
    
    func saveDiaryEntry(_ entry: DiaryEntry) async throws {
        let ref = diaryCollection(for: entry.userID).document(entry.id)
        try ref.setData(from: entry, merge: true) // ✅ safer writes
    }

    // MARK: - Load All Entries
    
    func loadDiaryEntries(for userID: String) async throws -> [DiaryEntry] {
        let snapshot = try await diaryCollection(for: userID)
            .order(by: "createdAt", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap { try? $0.data(as: DiaryEntry.self) }
    }

    // MARK: - Optional Extras
    
    func loadEntry(for userID: String, entryID: String) async throws -> DiaryEntry? {
        let doc = try await diaryCollection(for: userID).document(entryID).getDocument()
        return try doc.data(as: DiaryEntry.self)
    }

    func deleteEntry(for userID: String, entryID: String) async throws {
        try await diaryCollection(for: userID).document(entryID).delete()
    }
}
