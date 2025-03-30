//
//  WelcomeStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct WelcomeStepView: View {
    @EnvironmentObject var onboardingCoordinator: OnboardingCoordinator

    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome to dbtTracker!")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)

            Text("Let’s set up your experience to match your needs. You’ll choose what to track and when.")
                .font(.body)
                .multilineTextAlignment(.center)

            Button("Get Started") {
                onboardingCoordinator.goToNextStep()
            }
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
    }
}
