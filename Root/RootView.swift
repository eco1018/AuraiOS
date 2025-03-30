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
                HomeView(userProfile: profile)
                    .environmentObject(authVM)
            } else {
                ProgressView("Loading...")
            }
        }
    }
}
