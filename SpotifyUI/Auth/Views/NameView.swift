//
//  NameView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct NameView: View {
    @Binding var name: String
    @Binding var sendNewsAndOffers: Bool
    @Binding var shareRegistrationData: Bool
    let onNextTapped: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            SignupTitleTextView(text: String(localized: "What's your name?"))
            
            
            TextFieldView(footnote: String(localized: "This appears on your spotify profile")) {
                TextField(String(""), text: $name)
                    .keyboardType(.namePhonePad)
            }
            
            Spacer().frame(height: 26)
            
            VStack(alignment: .leading, spacing: 24) {
                Divider()
                    .frame(height: 1)
                    .overlay(Color.theme.neutral)
                
                
                Text(String(localized: "By tapping on \"Create Account\", you agree to the spotify Terms of Use."))
                    .font(Font.style.footnote)
                
                Text(String(localized: "Terms of Use"))
                    .foregroundStyle(Color.theme.primary)
                    .font(Font.style.footnote)
                
                Text(String(localized: "To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy."))
                    .foregroundStyle(Color.white)
                    .font(Font.style.footnote)
                
                Text(String(localized: "Privacy Policy"))
                    .foregroundStyle(Color.theme.primary)
                    .font(Font.style.footnote)
                
                Toggle(isOn: $sendNewsAndOffers){
                    Text(String(localized: "Please send me news and offers from Spotify."))
                        .font(Font.style.footnote)
                }
                .toggleStyle(CircleToggleStyle())
                
                Toggle(isOn: $shareRegistrationData){
                    Text(String(localized: "Share my registration data with Spotify’s content providers for marketing purposes."))
                        .font(Font.style.footnote)
                }
                .toggleStyle(CircleToggleStyle())
            }
            .fontWeight(.bold)
            
            Spacer()
            
            SignupButtonView(
                text: String(localized: "Create an account"),
                enabled: true,
                onTap: onNextTapped
            )
            
            Spacer().frame(height: 60)
        }
        .lineSpacing(4)
        .modifier(SignupLayoutModifier())
    }
}

struct CircleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Color.theme.primary)
            }
            .buttonStyle(.plain)
        }
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    NameView(
        name: .constant("Rasmus Hojlund"),
        sendNewsAndOffers: .constant(false),
        shareRegistrationData: .constant(true),
        onNextTapped: {}
    )
}
