//
//  FirestorePathHelper.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation
import FirebaseFirestore

/// Helper for building consistent Firestore paths throughout the app.
enum FirestorePathHelper {
    
    /// The base users collection.
    static var usersCollection: CollectionReference {
        Firestore.firestore().collection("users")
    }
    
    /// The document for a specific user.
    static func userDocument(for userID: String) -> DocumentReference {
        usersCollection.document(userID)
    }
    
    /// The `diaryEntries` subcollection for a given user.
    static func diaryEntriesCollection(for userID: String) -> CollectionReference {
        userDocument(for: userID).collection("diaryEntries")
    }
    
    /// A specific diary entry document by ID.
    static func diaryEntryDocument(for userID: String, entryID: String) -> DocumentReference {
        diaryEntriesCollection(for: userID).document(entryID)
    }
    
    /// (Optional) The userProfile document if stored separately (flat, not nested).
    static func userProfileDocument(for userID: String) -> DocumentReference {
        usersCollection.document(userID) // or `.collection("profiles").document(userID)` if you separate
    }
    
    /// The `medications` subcollection for a given user (for future expansion).
    static func medicationsCollection(for userID: String) -> CollectionReference {
        userDocument(for: userID).collection("medications")
    }
}
