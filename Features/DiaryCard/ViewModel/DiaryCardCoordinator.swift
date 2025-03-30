//
//  DiaryCardCoordinator.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation

@MainActor
final class DiaryCardCoordinator: ObservableObject {

    // MARK: - Dependencies

    private let userID: String

    // MARK: - Flow State

    @Published var currentStep: DiaryCardStep = .emotions
    @Published var viewModel: DiaryCardViewModel

    // MARK: - Init

    init(userID: String, timeOfDay: String) {
        self.userID = userID
        let viewModel = DiaryCardViewModel(userID: userID)
        self.viewModel = viewModel
    }

    // MARK: - Navigation

    func goToNextStep() {
        currentStep = currentStep.next()
    }

    func goToPreviousStep() {
        currentStep = currentStep.previous()
    }

    // MARK: - Reset

    func restart() {
        currentStep = .emotions
        viewModel = DiaryCardViewModel(userID: userID) // reset fresh entry
    }
}
