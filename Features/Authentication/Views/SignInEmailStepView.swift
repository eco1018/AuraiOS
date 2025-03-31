//
//
//  SignInEmailStepView.swift
//  Aura
//
//  Created by Ella A. Sadduq on 3/30/25.
//

//
//  SignInEmailStepView.swift
//  Aura
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct SignInEmailStepView: View {
    @Binding var email: String
    var onNext: (_ isNewUser: Bool) -> Void

    var body: some View {
        VStack(spacing: 32) {
            // 🌿 Header
            VStack(spacing: 8) {
                Text("Welcome to Aura")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
            }

            // 📧 Email Field
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            // ➡️ Navigation Buttons
            VStack(spacing: 16) {
                Button("Next") {
                    onNext(false)
                }
                .disabled(email.isEmpty)

                Button("I need to sign up") {
                    onNext(true)
                }
                .font(.subheadline)
                .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    SignInEmailStepView(
        email: .constant("test@example.com"),
        onNext: { isNewUser in
            print(isNewUser ? "Navigate to Sign Up" : "Navigate to Sign In")
        }
    )
}
