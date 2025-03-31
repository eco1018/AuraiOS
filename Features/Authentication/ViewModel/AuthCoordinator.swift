//
//  AuthCoordinator.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

//
//  AuthCoordinator.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import Foundation
import SwiftUI

@MainActor
final class AuthCoordinator: ObservableObject {
    
    // MARK: - Step Navigation
    
    @Published var currentStep: AuthStep = .email
    @Published var isNewUser: Bool = false
    
    // MARK: - User Input Draft
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthdate: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()

    // MARK: - Step Flow Control
    
    func goToNextStep() {
        switch currentStep {
        case .email:
            currentStep = isNewUser ? .signUpProfile : .signInPassword
        case .signUpProfile:
            currentStep = .signUpPassword
        case .signInPassword, .signUpPassword:
            currentStep = .complete
        default:
            break
        }
    }
    
    func goToPreviousStep() {
        switch currentStep {
        case .signInPassword, .signUpProfile:
            currentStep = .email
        case .signUpPassword:
            currentStep = .signUpProfile
        default:
            break
        }
    }
    
    var canGoBack: Bool {
        switch currentStep {
        case .email:
            return false
        default:
            return true
        }
    }
}
