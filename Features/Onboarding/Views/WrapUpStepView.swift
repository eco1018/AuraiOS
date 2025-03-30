//
//  WrapUpStepView.swift

import SwiftUI

struct WrapUpStepView: View {
    
    @EnvironmentObject var onboardingCoordinator: OnboardingCoordinator
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var isSaving = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("You're All Set!")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)

            Text("We’ve saved your preferences. You can adjust them later anytime in your profile.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }

            Button {
                Task {
                    await submitFinalProfile()
                }
            } label: {
                if isSaving {
                    ProgressView()
                } else {
                    Text("Finish Setup")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .disabled(isSaving)
        }
        .padding()
    }
    
    private func submitFinalProfile() async {
        guard let uid = authVM.userID else {
            errorMessage = "Could not find your user ID. Please try signing out and back in."
            return
        }

        isSaving = true
        errorMessage = nil

        do {
            try await onboardingVM.completeOnboarding(for: uid, using: onboardingCoordinator)
            await authVM.loadUserProfile(for: uid)
        } catch {
            errorMessage = "Failed to save profile: \(error.localizedDescription)"
        }

        isSaving = false
    }
}
