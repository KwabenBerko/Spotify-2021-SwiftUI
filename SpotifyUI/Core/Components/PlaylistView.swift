//
//  PlaylistView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/6/24.
//

import SwiftUI

struct PlaylistView: View {
    let playlist: Playlist
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

private extension PlaylistView {
    var artwork: some View {
        PlaylistImageView(
            image: playlist.image,
            size: size
        )
    }
    
    var title: some View {
        Text(playlist.title ?? "")
            .font(Font.style.caption4)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .lineSpacing(6)
            .lineLimit(2, reservesSpace: true)
            .multilineTextAlignment(.leading)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlaylistView(
        playlist: Playlist.indiePop,
        onTapped: {}
    )
}
