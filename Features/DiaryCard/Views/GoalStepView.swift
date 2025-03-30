//
//  GoalsStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct GoalStepView: View {
    var viewModel: DiaryCardViewModel
    var onNext: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Which goals did you complete?")
                .font(.title2)

            // Placeholder for goal checkboxes
            Text("Goal checkboxes go here")

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
