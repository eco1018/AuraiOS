//
//  DiaryWrapUpStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct DiaryWrapUpStepView: View {
    @Binding var isSubmitting: Bool
    @Binding var errorMessage: String?

    var onSubmit: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("All set for today?")
                .font(.title.bold())

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            HStack {
                Button("Back", action: onBack)
                Spacer()
                if isSubmitting {
                    ProgressView()
                } else {
                    Button("Submit", action: onSubmit)
                        .buttonStyle(.borderedProminent)
                }
            }
        }
        .padding()
    }
}
