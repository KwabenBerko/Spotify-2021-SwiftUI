//
//  SocialButtonView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import Foundation
import SwiftUI

struct SocialButtonView: View {
    
    let image: Image
    let text: String
    let onTap: () -> Void
    
    var body: some View {
        Button(
            action: onTap,
            label: {
                HStack {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                    
                    Text(text)
                        .font(Font.style.caption)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                }
            }
        )
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 45.0)
                .strokeBorder(Color.white, lineWidth: 0.6)
                .background(Color.clear)
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SocialButtonView(
        image: Image("GoogleIcon"),
        text: "Continue with Google",
        onTap: {}
    )
}


