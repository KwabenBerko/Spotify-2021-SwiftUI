//
//  Track.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import Foundation

struct Track: Equatable {
    var id: String = UUID().uuidString
    var title: String
    var image: String? = nil
    var artist: Artist
    var isEditorsPick: Bool = false
}

extension Track {
    static let les = Track(title: "Les", image: "Les", artist: Artist.childishGambino, isEditorsPick: true)
}
