//
//  Media.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/12/24.
//

import Foundation

enum Media: Equatable {
    case artist(Artist)
    case track(Track)
    case album(Album)
    case playlist(Playlist)
    case podcast(Podcast)
}

extension Media {
    var id: String {
        switch self {
        case .artist(let artist): return artist.id
        case .track(let track): return track.id
        case .album(let album): return album.id
        case .playlist(let playlist): return playlist.id
        case .podcast(let podcast): return podcast.id
        }
    }
    var isEditorsPick: Bool {
        switch self {
        case .artist(let artist): return artist.isEditorsPick
        case .track(let track): return track.isEditorsPick
        case .album(let album): return album.isEditorsPick
        case .playlist(let playlist): return playlist.isEditorsPick
        case .podcast(let podcast): return podcast.isEditorsPick
        }
    }
}
