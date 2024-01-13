//
//  PrimaryButtonView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import Foundation
import SwiftUI

struct PrimaryButtonView: View {
    
    let text: String
    let onTap: () -> Void
    
    var body: some View {
        Button(
            action: onTap,
            label: {
                Text(text)
                    .font(Font.style.caption)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.theme.background)
            }
        )
        .padding(.vertical, 14)
        .background(RoundedRectangle(cornerRadius: 45.0))
        .foregroundStyle(Color.theme.primary)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryButtonView(
        text: "Button text",
        onTap: {}
    )
}
