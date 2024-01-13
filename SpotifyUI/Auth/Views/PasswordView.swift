//
//  PasswordView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct PasswordView: View {
    @Binding var password: String
    let onNextTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            SignupTitleTextView(text: String(localized: "Create a password"))
            
            TextFieldView(footnote: String(localized: "Use at least 8 characters.")) {
                SecureField(String(""), text: $password)
                    .textFieldStyle(.plain)
            }
            
            Spacer().frame(height: 40)
            
            SignupButtonView(
                text: String(localized: "Next"),
                enabled: !password.isEmpty,
                onTap: onNextTapped
            )
            
            Spacer()
        }
        .modifier(SignupLayoutModifier())
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PasswordView(
        password: .constant("12345678"),
        onNextTapped: {}
    )
}
