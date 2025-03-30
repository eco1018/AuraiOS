//
//  RootView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct RootView: View {

    @StateObject private var authVM = AuthViewModel()
    @StateObject private var onboardingCoordinator = OnboardingCoordinator()
    @StateObject private var onboardingVM = OnboardingViewModel(
        onboardingService: AppServices.onboardingService
    )

    @State private var showingDiaryCard = false

    var body: some View {
        Group {
            if !authVM.isSignedIn {
                AuthFlowView()
                    .environmentObject(authVM)

            } else if let step = authVM.onboardingStep {
                OnboardingFlowView()
                    .environmentObject(authVM)
                    .environmentObject(onboardingCoordinator)
                    .environmentObject(onboardingVM)
                    .onAppear {
                        if let uid = authVM.userID {
                            onboardingCoordinator.enableAutoSave(using: onboardingVM, userID: uid)
                        }
                    }

            } else if let profile = authVM.userProfile {
                HomeView(userProfile: profile, onStartDiaryCard: {
                    showingDiaryCard = true
                })
                .environmentObject(authVM)
                .sheet(isPresented: $showingDiaryCard) {
                    if let uid = authVM.userID {
                        DiaryCardFlowView()
                            .environmentObject(DiaryCardCoordinator(
                                userID: uid,
                                timeOfDay: resolveTimeOfDay()
                            ))
                    } else {
                        Text("Missing User ID")
                    }
                }

            } else {
                ProgressView("Loading...")
            }
        }
    }

    private func resolveTimeOfDay() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour < 15 ? "Morning" : "Evening"
    }
}
