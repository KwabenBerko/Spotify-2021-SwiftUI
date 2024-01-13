//
//  FlatButtonView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import Foundation
import SwiftUI

struct FlatButtonView: View {
    
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
                    .foregroundStyle(Color.white)
            }
        )
        .padding(14)
        .background(Color.clear)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FlatButtonView(
        text: "Social media text",
        onTap: {}
    )
}


