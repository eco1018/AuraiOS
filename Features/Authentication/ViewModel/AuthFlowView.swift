//
//  AuthFlowView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
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
                        coordinator.goToPreviousStep()
                    }
                    .padding(.leading)
                }
                Spacer()
            }
            .padding(.top)
            
            Spacer()
            
            // Step Renderer
            switch coordinator.currentStep {
            case .email:
                SignInEmailStepView(
                    email: $coordinator.email
                ) { isNew in
                    coordinator.isNewUser = isNew
                    coordinator.goToNextStep()
                }
                
            case .signInPassword:
                SignInPasswordStepView(
                    email: coordinator.email,
                    password: $coordinator.password
                ) {
                    Task {
                        try? await authVM.signIn(
                            email: coordinator.email,
                            password: coordinator.password
                        )
                    }
                }
                
            case .signUpProfile:
                SignUpProfileStepView(
                    firstName: $coordinator.firstName,
                    lastName: $coordinator.lastName,
                    birthdate: $coordinator.birthdate
                ) {
                    coordinator.goToNextStep()
                }
                
            case .signUpPassword:
                SignUpPasswordStepView(
                    password: $coordinator.password
                ) {
                    Task {
                        try? await authVM.signUp(
                            email: coordinator.email,
                            password: coordinator.password,
                            firstName: coordinator.firstName,
                            lastName: coordinator.lastName,
                            birthdate: coordinator.birthdate
                        )
                    }
                }
                
            case .complete:
                Text("🎉 You're in!")
            }
            
            Spacer()
        }
        .environmentObject(coordinator)
        .padding(.horizontal)
        .animation(.easeInOut, value: coordinator.currentStep)
    }
}
