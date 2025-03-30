//
//  DiaryCardFlowView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct DiaryCardFlowView: View {

    @EnvironmentObject var coordinator: DiaryCardCoordinator

    @State private var isSubmitting = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            // MARK: - Active Step View
            switch coordinator.currentStep {
            case .emotions:
                EmotionStepView(
                    viewModel: coordinator.viewModel,
                    onNext: coordinator.goToNextStep
                )

            case .urges:
                UrgeStepView(
                    viewModel: coordinator.viewModel,
                    onNext: coordinator.goToNextStep,
                    onBack: coordinator.goToPreviousStep
                )

            case .actions:
                ActionStepView(
                    viewModel: coordinator.viewModel,
                    onNext: coordinator.goToNextStep,
                    onBack: coordinator.goToPreviousStep
                )

            case .goals:
                GoalStepView(
                    viewModel: coordinator.viewModel,
                    onNext: coordinator.goToNextStep,
                    onBack: coordinator.goToPreviousStep
                )

            case .medications:
                MedicationStepView(
                    viewModel: coordinator.viewModel,
                    onNext: coordinator.goToNextStep,
                    onBack: coordinator.goToPreviousStep
                )

            case .note:
                DiaryNoteStepView(
                    viewModel: coordinator.viewModel,
                    onNext: coordinator.goToNextStep,
                    onBack: coordinator.goToPreviousStep
                )

            case .wrapUp:
                DiaryWrapUpStepView(
                    isSubmitting: $isSubmitting,
                    errorMessage: $errorMessage,
                    onSubmit: submitFinalEntry,
                    onBack: coordinator.goToPreviousStep
                )
            }
        }
    }

    // MARK: - Final Submit

    private func submitFinalEntry() {
        Task {
            isSubmitting = true
            do {
                try await coordinator.viewModel.submitEntry()
                // Optionally reset or show a celebration screen
            } catch {
                errorMessage = "Failed to submit: \(error.localizedDescription)"
            }
            isSubmitting = false
        }
    }
}
