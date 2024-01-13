//
//  SignupButtonView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct SignupButtonView: View {
    let text: String
    var enabled: Bool = false
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onTap, label: {
                Text(text)
                    .font(Font.style.caption2)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 22)
                    .padding(.vertical, 12)
            })
            .disabled(false)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .foregroundStyle(backgroundColor)
            )
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

private extension SignupButtonView {
    var backgroundColor: Color {
        return enabled ? Color.white : Color.theme.neutral.opacity(0.8)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    SignupButtonView(
        text: "Button text",
        enabled: true,
        onTap: {}
    )
    .background(Color.theme.background)
}
