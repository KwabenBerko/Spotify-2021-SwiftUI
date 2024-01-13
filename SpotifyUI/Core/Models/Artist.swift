//
//  Artist.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import Foundation

struct Artist: Equatable {
    var id: String = UUID().uuidString
    var name: String
    var image: String? = nil
    var isSelected: Bool = false
    var isEditorsPick: Bool = false
}

extension Artist {
    static let billieEilish = Artist(name: "Billie Eilish", image: "BillieEilish")
    static let kanyeWest = Artist(name: "Kanye West")
    static let arianaGrande = Artist(name: "Ariana Grande", image: "ArianaGrande")
    static let lanaDelRey = Artist(name: "Lana Del Rey", image: "LanaDelRey")
    static let bts = Artist(name: "BTS", image: "BTS")
    static let drake = Artist(name: "Drake", image: "Drake")
    static let harryStyles = Artist(name: "Harry Styles", image: "HarryStyles")
    static let oneDirection = Artist(name: "One Direction", image: "OneDirection")
    static let rihanna = Artist(name: "Rihanna", image: "Rihanna")
    static let edSheeran = Artist(name: "Ed Sheeran", image: "EdSheeran")
    static let theWeeknd = Artist(name: "The Weeknd", image: "TheWeeknd")
    static let duaLipa = Artist(name: "Dua Lipa", image: "DuaLipa")
    static let theBeatles = Artist(name: "The Beatles")
    static let marvinGaye = Artist(name: "Marvin Gaye", image: "MarvinGaye")
    static let fkaTwigs = Artist(name: "FKA twigs", image: "FKATwigs")
    static let hozier = Artist(name: "Hozier", image: "Hozier")
    static let grimes = Artist(name: "Grimes", image: "Grimes")
    static let hayes = Artist(name: "HAYES", image: "Hayes")
    static let ledZeppelin = Artist(name: "Led Zeppelin", image: "LedZeppelin")
    static let childishGambino = Artist(name: "Childish Gambino")
    static let lolozouai = Artist(name: "Lolo Zouaï", image: "LoloZouai")
}
