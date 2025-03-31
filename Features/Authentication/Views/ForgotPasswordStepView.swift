//
//  ForgotPasswordStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct ForgotPasswordStepView: View {
    @Binding var email: String
    var onReset: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Forgot Password?")
                .font(.title2.bold())
                .padding(.top, 24)

            Text("Enter the email address associated with your account.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            Button("Send Reset Link") {
                onReset()
            }
            .disabled(email.isEmpty)
            .frame(maxWidth: .infinity)
            .padding()
            .background(email.isEmpty ? Color.gray.opacity(0.3) : Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)

            Button("Back to Sign In") {
                onBack()
            }
            .font(.footnote)
            .foregroundColor(.blue)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ForgotPasswordStepView(
        email: .constant("user@example.com"),
        onReset: { print("Reset password triggered") },
        onBack: { print("Back to sign in") }
    )
}
