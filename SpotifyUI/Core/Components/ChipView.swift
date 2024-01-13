//
//  ChipView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 3/10/24.
//

import SwiftUI

struct ChipView: View {
    let title: String
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            Text(title)
                .font(Font.style.caption2)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 45.0)
                .strokeBorder(Color(hex: "7F7F7F"), lineWidth: 0.6)
                .background(Color.theme.background)
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ChipView(
        title: "Playlists",
        onTapped: {}
    )
}
