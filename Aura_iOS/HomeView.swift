//
//  HomeView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct HomeView: View {
    let userProfile: UserProfile
    let onStartDiaryCard: () -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Welcome back, \(userProfile.identity.firstName)")
                    .font(.title.bold())
                    .padding(.top)

                Button("Start Diary Card") {
                    onStartDiaryCard()
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(12)

                Spacer()
            }
            .padding()
            .navigationTitle("Aura")
        }
    }
}
