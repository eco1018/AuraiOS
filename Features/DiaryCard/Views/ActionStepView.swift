//
//  ActionsStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct ActionStepView: View {
    var viewModel: DiaryCardViewModel
    var onNext: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Did any of these actions occur today?")
                .font(.title2)

            // Placeholder for Yes/No toggles
            Text("Action toggles go here")

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
