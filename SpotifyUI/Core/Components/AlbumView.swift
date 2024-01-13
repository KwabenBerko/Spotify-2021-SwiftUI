//
//  AlbumView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/6/24.
//

import SwiftUI

struct AlbumView: View {
    let album: Album
    var size: CGSize = CGSize(width: 110, height: 110)
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            VStack(alignment: .leading) {
                artwork
                
                Spacer().frame(height: 12)
                
                title
            }
            .background(Color.theme.background)
            .frame(width: size.width)
        }
    }
}

private extension AlbumView {
    var artwork: some View {
        AlbumImageView(
            image: album.image,
            size: size
        )
    }
    
    var title: some View {
        Text(album.title)
            .font(Font.style.caption4)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .lineSpacing(6)
            .lineLimit(2, reservesSpace: true)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlbumView(
        album: Album.oneRemastered,
        onTapped: {}
    )
}

