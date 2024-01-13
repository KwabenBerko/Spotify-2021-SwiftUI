//
//  EditorsPickView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/12/24.
//

import SwiftUI

struct EditorsPickView: View {
    let pick: EditorsPick
    let size: CGSize
    let onTapped: () -> Void
    
    var body: some View {
        switch pick.media {
        case .track(let track):
            TrackView(track: track, size: size, onTapped: {})
        case .artist(let artist):
            ArtistView(artist: artist, size: size, onTapped: {})
        case .playlist(let playlist):
            PlaylistView(playlist: playlist, size: size, onTapped: {})
        case .album(let album):
            AlbumView(album: album, size: size, onTapped: {})
        case .podcast(let podcast):
            PodcastView(podcast: podcast, size: size, onTapped: {})
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        
        EditorsPickView(
            pick: EditorsPick(media: .track(.les)),
            size: CGSize(width: 110, height: 110),
            onTapped: {}
        )
        
        EditorsPickView(
            pick: EditorsPick(media: .artist(.fkaTwigs)),
            size: CGSize(width: 110, height: 110),
            onTapped: {}
        )
        
        EditorsPickView(
            pick: EditorsPick(media: .playlist(.edSheeranBigSeanJuiceWRLDPostMalone)),
            size: CGSize(width: 110, height: 110),
            onTapped: {}
        )
        
        EditorsPickView(
            pick: EditorsPick(media: .album(.oneRemastered)),
            size: CGSize(width: 110, height: 110),
            onTapped: {}
        )
        
        EditorsPickView(
            pick: EditorsPick(media: .podcast(.itsALot)),
            size: CGSize(width: 110, height: 110),
            onTapped: {}
        )
    }
}
