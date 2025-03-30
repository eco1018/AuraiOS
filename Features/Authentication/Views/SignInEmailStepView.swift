//
//  SignInEmailStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//


import SwiftUI

struct SignInEmailStepView: View {
    @Binding var email: String
    var onNext: (_ isNewUser: Bool) -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Enter your email")
                .font(.title2.bold())
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            Button("Next: Sign In") {
                onNext(false)
            }
            .disabled(email.isEmpty)

            Button("I need to sign up") {
                onNext(true)
            }
            .font(.subheadline)
            .foregroundColor(.blue)
        }
        .padding()
    }
}