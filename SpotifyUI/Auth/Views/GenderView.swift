//
//  GenderView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct GenderView: View {
    let onNextTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            SignupTitleTextView(text: String(localized: "What's your gender?"))
            
            TextFieldView {
                TextField(String(""), text: .constant(String("")))
                    .disabled(true)
                    .keyboardType(.emailAddress)
            }
            
            Spacer().frame(height: 40)
            
            SignupButtonView(
                text: String(localized: "Next"),
                enabled: true,
                onTap: onNextTapped
            )
            
            Spacer()
        }
        .modifier(SignupLayoutModifier())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GenderView(
        onNextTapped: {}
    )
}
