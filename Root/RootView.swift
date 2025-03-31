//
//
//
//  RootView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct RootView: View {

    // MARK: - Coordinators and ViewModels
    @StateObject private var appCoordinator = AppCoordinator()
    @StateObject private var authVM: AuthViewModel
    @StateObject private var onboardingCoordinator = OnboardingCoordinator()
    @StateObject private var onboardingVM = OnboardingViewModel(
        onboardingService: AppServices.onboardingService
    )

    @State private var showingDiaryCard = false

    // MARK: - Init
    init() {
        let coordinator = AppCoordinator()
        _appCoordinator = StateObject(wrappedValue: coordinator)
        _authVM = StateObject(wrappedValue: AuthViewModel(appCoordinator: coordinator))
    }

    // MARK: - Body
    var body: some View {
        VStack {
            if !appCoordinator.isLoggedIn {
                AuthFlowView()
                    .environmentObject(authVM)
                    .environmentObject(appCoordinator)

            } else if !appCoordinator.hasCompletedOnboarding {
                OnboardingFlowView()
                    .environmentObject(authVM)
                    .environmentObject(appCoordinator)
                    .environmentObject(onboardingCoordinator)
                    .environmentObject(onboardingVM)
                    .onAppear {
                        if let uid = appCoordinator.currentUserID {
                            onboardingCoordinator.enableAutoSave(using: onboardingVM, userID: uid)
                        }
                    }

            } else if let profile = authVM.userProfile {
                HomeView(userProfile: profile, onStartDiaryCard: {
                    showingDiaryCard = true
                })
                .environmentObject(authVM)
                .environmentObject(appCoordinator)
                .sheet(isPresented: $showingDiaryCard) {
                    if let uid = appCoordinator.currentUserID {
                        DiaryCardFlowView()
                            .environmentObject(DiaryCardCoordinator(
                                userID: uid,
                                timeOfDay: resolveTimeOfDay()
                            ))
                            .environmentObject(appCoordinator)
                    } else {
                        Text("Missing User ID")
                    }
                }

            } else {
                // Graceful fallback in case of delayed profile fetch
                ProgressView("Loading profile...")
                    .onAppear {
                        if let uid = appCoordinator.currentUserID,
                           authVM.userProfile == nil {
                            Task {
                                try? await authVM.loadUserProfile(for: uid)
                            }
                        }
                    }
            }
        }
    }

    // MARK: - Helpers
    private func resolveTimeOfDay() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour < 15 ? "Morning" : "Evening"
    }
}
