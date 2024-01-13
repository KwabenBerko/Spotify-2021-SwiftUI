//
//  Album.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import Foundation

struct Album: Equatable {
    var id: String = UUID().uuidString
    var title: String
    var artist: Artist
    var image: String? = nil
    var isEditorsPick: Bool = false
}

extension Album {
    static let oneRemastered = Album(title: "1(Remastered)", artist: Artist.theBeatles, image: "OneRemastered")
}

