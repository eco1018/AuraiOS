//
//  AuthFlowView.swift
//  Aura_iOS
//
//
//  AuthFlowView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct AuthFlowView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject private var coordinator = AuthCoordinator()
    
    var body: some View {
        VStack {
            // Top Nav
            HStack {
                if coordinator.canGoBack {
                    Button("Back") {
                        print("DEBUG: Back button pressed")
                        coordinator.goToPreviousStep()
                    }
                    .padding(.leading)
                }
                Spacer()
            }
            .padding(.top)
            
            Spacer()
            
            // Step Renderer
            Group {
                switch coordinator.currentStep {
                case .email:
                    SignInEmailStepView(
                        email: $coordinator.email
                    ) { isNew in
                        print("DEBUG: Email step completed, isNewUser: \(isNew)")
                        coordinator.isNewUser = isNew
                        coordinator.goToNextStep()
                    }
                    
                case .signInPassword:
                    SignInPasswordStepView(
                        email: coordinator.email,
                        password: $coordinator.password
                    ) {
                        print("DEBUG: Attempting sign in with email: \(coordinator.email)")
                        Task {
                            do {
                                try await authVM.signIn(
                                    email: coordinator.email,
                                    password: coordinator.password
                                )
                                print("DEBUG: Sign in successful")
                            } catch {
                                print("DEBUG: Sign in failed with error: \(error)")
                            }
                        }
                    }
                    
                case .signUpProfile:
                    SignUpProfileStepView(
                        firstName: $coordinator.firstName,
                        lastName: $coordinator.lastName,
                        birthdate: $coordinator.birthdate
                    ) {
                        print("DEBUG: Profile step completed")
                        coordinator.goToNextStep()
                    }
                    
                case .signUpPassword:
                    SignUpPasswordStepView(
                        password: $coordinator.password
                    ) {
                        print("DEBUG: Attempting sign up")
                        Task {
                            do {
                                try await authVM.signUp(
                                    email: coordinator.email,
                                    password: coordinator.password,
                                    firstName: coordinator.firstName,
                                    lastName: coordinator.lastName,
                                    birthdate: coordinator.birthdate
                                )
                                print("DEBUG: Sign up successful")
                            } catch {
                                print("DEBUG: Sign up failed with error: \(error)")
                            }
                        }
                    }
                    
                case .complete:
                    Text("🎉 You're in!")
                }
            }
            
            Spacer()
        }
        .environmentObject(coordinator)
        .padding(.horizontal)
        .animation(.easeInOut, value: coordinator.currentStep)
        .onAppear {
            print("DEBUG: AuthFlowView appeared, current step: \(coordinator.currentStep)")
        }
    }
}
