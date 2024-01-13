//
//  Genre.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/20/24.
//

import Foundation

struct Genre: Equatable {
    var id: String = UUID().uuidString
    var name: String
    var hexColor: String
    var image: String? = nil
}

extension Genre {
    static let pop = Genre(name: "Pop", hexColor: "#9854B2", image: "Pop")
    static let indie = Genre(name: "Indie", hexColor: "#678026")
    static let newsAndPolitics = Genre(name: "News & Politics", hexColor: "#3371E4")
    static let comedy = Genre(name: "Comedy", hexColor: "#CF4321")
    static let podcasts = Genre(name: "Podcasts", hexColor: "#223160")
    static let charts = Genre(name: "Charts", hexColor: "#8768A7")
    static let madeForYou = Genre(name: "Made for you", hexColor: "#75A768")
    static let wrapped2021 = Genre(name: "2021 Wrapped", hexColor: "#ABBB6D")
}
