//
//   SignInPasswordStepView.swift
//  Aura_iOS

//
//
//  SignInPasswordStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct SignInPasswordStepView: View {
    let email: String
    @Binding var password: String
    let onSubmit: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back")
                .font(.title)
                .bold()

            Text("Enter your password for \(email)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            SecureField("Password", text: $password)
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button(action: {
                onSubmit()
            }) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(password.isEmpty ? Color.gray.opacity(0.3) : Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(password.isEmpty)
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    SignInPasswordStepView(
        email: "test@example.com",
        password: .constant("password123"),
        onSubmit: {
            print("Submit tapped")
        }
    )
}
