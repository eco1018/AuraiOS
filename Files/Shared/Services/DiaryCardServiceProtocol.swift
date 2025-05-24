//
//  DiaryCardServiceProtocol.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

protocol DiaryCardServiceProtocol {
    func saveDiaryEntry(_ entry: DiaryEntry) async throws
    func loadDiaryEntries(for userID: String) async throws -> [DiaryEntry]
}
