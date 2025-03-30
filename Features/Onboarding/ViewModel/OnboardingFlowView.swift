//
//  OnboardingFlowView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct OnboardingFlowView: View {
    @EnvironmentObject var onboardingCoordinator: OnboardingCoordinator

    var body: some View {
        VStack {
            HStack {
                if onboardingCoordinator.canGoBack {
                    Button("Back") {
                        onboardingCoordinator.goToPreviousStep()
                    }
                    .padding(.leading)
                }
                Spacer()
            }
            .padding(.top)

            Spacer()

            switch onboardingCoordinator.currentStep {
            case .welcome:
                WelcomeStepView()
            case .profileSetup:
                ProfileSetupStepView()
            case .diaryIntro:
                DiaryIntroStepView()
            case .actionsIntro:
                ActionsIntroStepView()
            case .actionsSelection:
                ActionsSelectionStepView()
            case .actionsTransition:
                ActionsTransitionStepView()
            case .urgesIntro:
                UrgesIntroStepView()
            case .urgesSelection:
                UrgesSelectionStepView()
            case .urgesTransition:
                UrgesTransitionStepView()
            case .goalsIntro:
                GoalsIntroStepView()
            case .goalsSelection:
                GoalsSelectionStepView()
            case .goalsTransition:
                GoalsTransitionStepView()
            case .medicationsIntro:
                MedicationsIntroStepView()
            case .medicationAdding:
                MedicationAddingStepView()
            case .medicationReminder:
                MedicationReminderStepView()
            case .diaryCardReminder:
                DiaryCardReminderStepView()
            case .wrapUp:
                WrapUpStepView()
            }

            Spacer()
        }
        .animation(.easeInOut, value: onboardingCoordinator.currentStep)
        .padding(.horizontal)
    }
}
