
//  AuraApp.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/31/25.
//

import SwiftUI
import FirebaseCore

@main
struct AuraApp: App {
    
    init() {
        // Initialize Firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
