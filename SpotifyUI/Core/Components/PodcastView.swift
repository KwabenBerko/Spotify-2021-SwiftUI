//
//  PodcastView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/24/24.
//

import SwiftUI

struct PodcastView: View {
    let podcast: Podcast
    var size: CGSize = CGSize(width: 100, height: 100)
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            VStack {
                artwork
                
                Spacer().frame(height: 12)
                
                title.opacity(podcast.artwork.isImage ? 1.0 : 0.0)
            }
            .background(Color.theme.background)
            .frame(width: size.width)
        }
    }
}

private extension PodcastView {
    var artwork: some View {
        SelectionOverlayView(isSelected: podcast.isSelected) {
            PodcastImageView(
                artwork: podcast.artwork,
                artworkTitle: podcast.artwork.isImage ? nil : podcast.title,
                size: size
            )
        }
    }
    
    var title: some View {
        PodcastTitleView(title: podcast.title)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        PodcastView(
            podcast: Podcast.rottenMango,
            onTapped: {}
        )
        
        PodcastView(
            podcast: Podcast.moreInComedy,
            onTapped: {}
        )
    }
}
