//
//  ArtistView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct ArtistView: View {
    let artist: Artist
    var size: CGSize = CGSize(width: 110, height: 110)
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            VStack {
                artwork
                
                Spacer().frame(height: 12)
                
                title
            }
            .background(Color.theme.background)
            .frame(width: size.width)
        }
    }
}

private extension ArtistView {
    var artwork: some View {
        SelectionOverlayView(isSelected: artist.isSelected) {
            ArtistImageView(
                image: artist.image,
                size: size
            )
        }
    }
    
    var title: some View {
        Text(artist.name)
            .font(Font.style.caption4)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .lineSpacing(6)
            .lineLimit(2, reservesSpace: true)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ArtistView(
        artist: Artist.billieEilish,
        onTapped: {}
    )
}
