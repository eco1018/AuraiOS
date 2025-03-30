//
//  OnboardingStep.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation

enum OnboardingStep: Int, CaseIterable, Codable {
    case welcome                // 1
    case profileSetup           // 2
    case diaryIntro             // 3
    case actionsIntro           // 4
    case actionsSelection       // 5
    case actionsTransition      // 6
    case urgesIntro             // 7
    case urgesSelection         // 8
    case urgesTransition        // 9
    case goalsIntro             // 10
    case goalsSelection         // 11
    case goalsTransition        // 12
    case medicationsIntro       // 13
    case medicationAdding       // 14
    case medicationReminder     // 15
    case diaryCardReminder      // 16
    case wrapUp                 // 17

    func next() -> OnboardingStep {
        let all = OnboardingStep.allCases
        let index = self.rawValue
        return index < all.count - 1 ? all[index + 1] : self
    }

    func previous() -> OnboardingStep {
        let index = self.rawValue
        return index > 0 ? OnboardingStep.allCases[index - 1] : self
    }
}
