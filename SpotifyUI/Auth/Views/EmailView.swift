//
//  EmailView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct EmailView: View {
    @Binding var email: String
    let onNextTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            SignupTitleTextView(text: String(localized: "What's your email?"))
            
            TextFieldView(footnote: String(localized: "You'll need to confirm this email later.")){
                TextField(String(""), text: $email)
                    .keyboardType(.emailAddress)
            }
            
            
            Spacer().frame(height: 40)
            
            SignupButtonView(
                text: String(localized: "Next"),
                enabled: !email.isEmpty,
                onTap: onNextTapped
            )
            
            Spacer()
        }
        .modifier(SignupLayoutModifier())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    EmailView(
        email: .constant("rasmushojlund@gmail.com"),
        onNextTapped: {}
    )
}
