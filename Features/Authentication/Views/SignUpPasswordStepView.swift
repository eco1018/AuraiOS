//
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
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            Button("Create Account") {
                onSubmit()
            }
            .disabled(password.count < 6)
            .padding(.top, 16)

            Text("Password must be at least 6 characters.")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
