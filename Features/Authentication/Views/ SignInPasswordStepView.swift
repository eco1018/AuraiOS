//
//   SignInPasswordStepView.swift
//  Aura_iOS

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
    let onSubmit: () -> Void  // ✅ Allows parent view to handle sign-in

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
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

            Button(action: {
                onSubmit()
            }) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    @State var previewPassword = "password123"
    
    return SignInPasswordStepView(
        email: "test@example.com",
        password: .constant("password123"),
        onSubmit: {
            print("Submit tapped")
        }
    )
}
