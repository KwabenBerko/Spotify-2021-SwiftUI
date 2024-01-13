//
//  Playlist.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import Foundation

struct Playlist: Equatable {
    var id: String = UUID().uuidString
    var title: String? = nil
    var image: String? = nil
    var tracks: [Track] = []
    var isEditorsPick: Bool = false
}

extension Playlist {
    static let indiePop = Playlist(title: "Indie Pop", image: "IndiePop")
    static let edSheeranBigSeanJuiceWRLDPostMalone = Playlist(
        title: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone", image: "EdSheeranBigSeanJuiceWRLDPostMalone"
    )
    static let mitskiTameImpalaGlassAnimalsCharlieXCX =  Playlist(
        title: "Mitski, Tame Impala, Glass Animals, Charlie XCX", image: "MitskiTameImpalaGlassAnimalsCharlieXCX"
    )
    static let todaysTopHits = Playlist(image: "TodaysTopHits")
    static let frontLeft = Playlist(title: "Front Left", image: "FrontLeft")
}
