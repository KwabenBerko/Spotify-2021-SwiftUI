//
//  RecentSearchListView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 3/10/24.
//

import SwiftUI

struct MediaListView: View {
    let mediaList: [Media]
    let onMediaTapped: (Media) -> Void
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 8) {
                ForEach(mediaList, id: \.id) { media in
                    MediaView(media: media) {
                        onMediaTapped(media)
                    }
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MediaListView(
        mediaList: mockRecentSearches,
        onMediaTapped: { _ in }
    )
}
