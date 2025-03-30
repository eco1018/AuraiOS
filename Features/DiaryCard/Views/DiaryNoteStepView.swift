//
//  DailyNoteStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct DiaryNoteStepView: View {
    var viewModel: DiaryCardViewModel
    var onNext: () -> Void
    var onBack: () -> Void

    @State private var noteText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Want to leave a note about your day?")
                .font(.title2)

            TextEditor(text: $noteText)
                .frame(height: 200)
                .border(Color.gray.opacity(0.3))

            HStack {
                Button("Back", action: onBack)
                Spacer()
                Button("Next", action: {
                    viewModel.updateDiaryNote(noteText)
                    onNext()
                })
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
