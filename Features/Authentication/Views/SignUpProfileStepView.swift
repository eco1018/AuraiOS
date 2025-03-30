//
//  SignUpProfileStepView.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/30/25.
//
import SwiftUI

struct SignUpProfileStepView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var age: String

    var onNext: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Tell us about you")
                .font(.title2.bold())
                .padding(.top, 24)

            TextField("First Name", text: $firstName)
                .textContentType(.givenName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            TextField("Last Name", text: $lastName)
                .textContentType(.familyName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            Button("Next: Create Password") {
                onNext()
            }
            .disabled(firstName.isEmpty || lastName.isEmpty || age.isEmpty)
            .padding(.top, 16)
        }
        .padding()
    }
}
