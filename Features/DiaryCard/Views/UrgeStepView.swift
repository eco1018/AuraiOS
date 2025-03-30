//
//  UrgesStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct UrgeStepView: View {
    var viewModel: DiaryCardViewModel
    var onNext: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Did you experience any urges today?")
                .font(.title2)

            // Placeholder for urge sliders
            Text("Urge tracking goes here")

            HStack {
                Button("Back", action: onBack)
                Spacer()
                Button("Next", action: onNext)
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
