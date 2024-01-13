//
//  RecentSearchView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/11/24.
//

import SwiftUI

struct MediaView: View {
    let media: Media
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            HStack {
                image
                
                Spacer().frame(width: 12)
                
                VStack(alignment: .leading) {
                    title
                    
                    Spacer().frame(height: 4)
                    
                    info
                }
            }
            .padding(4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.theme.background)
        }
    }
}

private extension MediaView {
    var image: some View {
        let size =  CGSize(width: 50, height: 50)
        
        return ZStack {
            switch media {
            case .track(let track):
                TrackImageView(image: track.image, size: size)
            case .artist(let artist):
                ArtistImageView(image: artist.image, size: size)
            case .podcast(let podcast):
                PodcastImageView(artwork: podcast.artwork, size: size)
            case .album(let album):
                AlbumImageView(image: album.image, size: size)
            case .playlist(let playlist):
                PlaylistImageView(image: playlist.image, size: size)
            }
        }
    }
    
    var title: some View {
        let title: String
        
        switch media {
        case .track(let track):
            title = track.title
        case .artist(let artist):
            title = artist.name
        case .podcast(let podcast):
            title = podcast.title
        case .album(let album):
            title = album.title
        case .playlist(let playlist):
            title = playlist.title ?? ""
        }
        
        return Text(title)
            .font(Font.style.caption)
            .fontWeight(.medium)
            .lineLimit(1)
            .foregroundStyle(Color.white)
    }
    
    var editorsPickIcon: some View {
        Text(String("E"))
            .font(Font.style.footnote2)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
            .padding(.vertical, 2)
            .padding(.horizontal, 5)
            .background(Color(hex: "#C4C4C4"))
            .clipShape(RoundedRectangle(cornerRadius: 3))
    }
    
    var info: some View {
        let info: String
        
        switch media {
        case .track(let track):
            info = String(localized: "Song • \(track.artist.name)")
        case .artist(_):
            info = String(localized: "Artist")
        case .playlist(_):
            info = String(localized: "Playlist")
        case .podcast(_):
            info = String(localized: "Podcast")
        case .album(let album):
            info = String(localized: "Album • \(album.artist.name)")
        }
        
        return HStack(spacing: 0) {
            if media.isEditorsPick {
                editorsPickIcon
                Spacer().frame(width: 5)
            }
            
            Text(info)
                .font(Font.style.caption2)
                .fontWeight(.medium)
                .foregroundStyle(Color(hex: "#B3B3B3"))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        ForEach(mockRecentSearches, id: \.id) { media in
            MediaView(
                media: media,
                onTapped: {}
            )
        }
    }
}
