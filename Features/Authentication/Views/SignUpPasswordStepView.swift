//
//  SignUpPasswordStepView.swift
//  Aura_iOS
///
//  SignUpPasswordStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//

import SwiftUI

struct SignUpPasswordStepView: View {
    @Binding var password: String
    var onSubmit: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Create a password")
                .font(.title2.bold())
                .padding(.top, 24)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button(action: {
                onSubmit()
            }) {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(password.count < 6 ? Color.gray.opacity(0.3) : Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(password.count < 6)
            .padding(.horizontal)

            Text("Password must be at least 6 characters.")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    SignUpPasswordStepView(
        password: .constant(""),
        onSubmit: {
            print("Create Account tapped")
        }
    )
}
