//
//  ProfileSetupStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import SwiftUI

struct ProfileSetupStepView: View {
    @EnvironmentObject var onboardingCoordinator: OnboardingCoordinator

    var body: some View {
        VStack(spacing: 24) {
            Text("About You")
                .font(.title.bold())

            TextField("First Name", text: $onboardingCoordinator.firstName)
                .textFieldStyle(.roundedBorder)

            TextField("Last Name", text: $onboardingCoordinator.lastName)
                .textFieldStyle(.roundedBorder)

            DatePicker("Birthdate", selection: $onboardingCoordinator.birthdate, displayedComponents: [.date])
                .datePickerStyle(.graphical)

            Button("Continue") {
                onboardingCoordinator.goToNextStep()
            }
            .disabled(onboardingCoordinator.firstName.isEmpty || onboardingCoordinator.lastName.isEmpty)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
    }
}

