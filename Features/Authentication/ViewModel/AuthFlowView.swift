///
//  AuthFlowView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct AuthFlowView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject private var coordinator = AuthCoordinator()
    @State private var showError = false
    
    var body: some View {
        ZStack {
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
                                    showError = true
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
                            print("DEBUG: Email: \(coordinator.email)")
                            print("DEBUG: Name: \(coordinator.firstName) \(coordinator.lastName)")
                            
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
                                    showError = true
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
            .disabled(authVM.isLoading)
            
            // Loading overlay
            if authVM.isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                ProgressView("Creating account...")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .alert("Error", isPresented: $showError) {
            Button("OK") {
                showError = false
            }
        } message: {
            Text(authVM.errorMessage ?? "An unknown error occurred")
        }
        .onAppear {
            print("DEBUG: AuthFlowView appeared, current step: \(coordinator.currentStep)")
        }
    }
}
