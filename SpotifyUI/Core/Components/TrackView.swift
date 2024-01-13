//
//  TrackView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/12/24.
//

import SwiftUI

struct TrackView: View {
    let track: Track
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

private extension TrackView {
    var artwork: some View {
        TrackImageView(
            image: track.image,
            size: size
        )
    }
    
    var title: some View {
        Text(track.title)
            .font(Font.style.caption4)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .lineSpacing(6)
            .lineLimit(2, reservesSpace: true)
            .multilineTextAlignment(.leading)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TrackView(
        track: Track.les,
        onTapped: {}
    )
}
