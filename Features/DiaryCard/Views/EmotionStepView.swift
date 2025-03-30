//
//  EmotionStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct EmotionStepView: View {
    var viewModel: DiaryCardViewModel
    var onNext: () -> Void

    var body: some View {
        VStack {
            Text("Emotion Step View")
            Button("Next", action: onNext)
        }
        .padding()
    }
}
