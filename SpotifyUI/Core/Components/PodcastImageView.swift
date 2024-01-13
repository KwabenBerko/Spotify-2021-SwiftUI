//
//  PodcastImageView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/11/24.
//

import SwiftUI

struct PodcastImageView: View {
    let artwork: PodcastArtwork
    var artworkTitle: String? = nil
    let size: CGSize
    
    var body: some View {
        ZStack(alignment: .center) {
            switch artwork {
            case .image(let image):
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width)
                    .clipped()
                
            case .color(let hex):
                Color(hex: hex)
                
                if let title = artworkTitle {
                    PodcastTitleView(title: title)
                        .padding(7)
                }
            }
        }
        .frame(width: size.width, height: size.height)
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        PodcastImageView(
            artwork: Podcast.rottenMango.artwork,
            size: CGSize(width: 100, height: 100)
        )
        
        PodcastImageView(
            artwork: PodcastArtwork.color("#5AB1DF"),
            artworkTitle: String("Some Interesting Podcast"),
            size: CGSize(width: 100, height: 100)
        )
    }
}
