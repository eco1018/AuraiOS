//
//
//  SignInEmailStepView.swift
//  Aura
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
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // ➡️ Navigation Buttons
            VStack(spacing: 16) {
                Button(action: {
                    onNext(false)
                }) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(email.isEmpty ? Color.gray.opacity(0.3) : Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(email.isEmpty)

                Button(action: {
                    onNext(true)
                }) {
                    Text("I need to sign up")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
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
