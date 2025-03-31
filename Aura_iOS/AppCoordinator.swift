//
//  AppCoordinator.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import Foundation
import SwiftUI

@MainActor
final class AppCoordinator: ObservableObject {

    // MARK: - Global App State
    @Published var isLoggedIn: Bool = false
    @Published var hasCompletedOnboarding: Bool = false
    @Published var currentUserID: String? = nil

    // MARK: - Lifecycle Control
    func resetAppState() {
        isLoggedIn = false
        hasCompletedOnboarding = false
        currentUserID = nil
    }
}
