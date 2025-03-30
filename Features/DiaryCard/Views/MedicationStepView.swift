//
//  MedicationsStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct MedicationStepView: View {
    var viewModel: DiaryCardViewModel
    var onNext: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Did you take your medications today?")
                .font(.title2)

            // Placeholder for Yes/No or toggles
            Text("Medication tracking UI goes here")

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
