//
//  DiaryCardViewModel.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

@MainActor
final class DiaryCardViewModel: ObservableObject {
    
    // MARK: - Dependencies
    
    private let diaryCardService: DiaryCardServiceProtocol
    private let userID: String

    // MARK: - Current Draft

    @Published var currentEntry: DiaryEntry

    // MARK: - Init

    init(userID: String, diaryCardService: DiaryCardServiceProtocol = AppServices.diaryCardService) {
        self.userID = userID
        self.diaryCardService = diaryCardService
        self.currentEntry = DiaryEntry.empty(for: userID, timeOfDay: "Morning") // Or "Evening"
    }

    // MARK: - Actions

    func updateEmotion(id: String, value: Int) {
        if let index = currentEntry.emotions.firstIndex(where: { $0.id == id }) {
            currentEntry.emotions[index].value = value
            currentEntry.emotions[index].timestamp = Date()
        }
    }

    func updateGoal(id: String, didComplete: Bool) {
        if let index = currentEntry.goals.firstIndex(where: { $0.id == id }) {
            currentEntry.goals[index].didComplete = didComplete
        }
    }

    func updateUrge(id: String, intensity: Int) {
        if let index = currentEntry.urges.firstIndex(where: { $0.id == id }) {
            currentEntry.urges[index].intensity = intensity
        }
    }

    func updateAction(id: String, didOccur: Bool) {
        if let index = currentEntry.actions.firstIndex(where: { $0.id == id }) {
            currentEntry.actions[index].didOccur = didOccur
        }
    }

    func setMedicationStatus(_ tookMedications: Bool?) {
        currentEntry.tookMedications = tookMedications
    }

    func setDiaryNote(_ text: String) {
        currentEntry.diaryNote = text
    }

    // MARK: - Final Submission

    func submitEntry() async throws {
        currentEntry.createdAt = Date()
        try await diaryCardService.saveDiaryEntry(currentEntry)
    }
}
