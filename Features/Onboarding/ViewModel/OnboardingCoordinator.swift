//
//  OnboardingCoordinator.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class OnboardingCoordinator: ObservableObject {
    
    // MARK: - Step Tracking
    @Published var currentStep: OnboardingStep = .welcome

    // MARK: - User Input Draft
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthdate: Date = Date()
    
    @Published var actions: [ActionPreference] = []
    @Published var urges: [UrgePreference] = []
    @Published var goals: [GoalPreference] = []

    @Published var takesMedications: Bool = false
    @Published var medications: [Medication] = []

    @Published var notificationPreference = NotificationPreference.defaultOncePerDay

    // MARK: - Flow Control
    func goToNextStep() {
        currentStep = currentStep.next()
    }

    func goToPreviousStep() {
        currentStep = currentStep.previous()
    }

    var canGoBack: Bool {
        currentStep != .welcome
    }

    // MARK: - Autosave Support
    private var cancellables = Set<AnyCancellable>()

    func enableAutoSave(using viewModel: OnboardingViewModel, userID: String) {
        $currentStep
            .dropFirst()
            .sink { _ in
                Task {
                    let draft = self.asPartialUserProfile(userID: userID)
                    try? await viewModel.onboardingService.saveUserProfile(draft, for: userID)
                }
            }
            .store(in: &cancellables)
    }
}
