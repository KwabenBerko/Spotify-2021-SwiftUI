//
//  SpotifyUIApp.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import SwiftUI

let mockTracks: [Track] = [
    .les
]

let mockArtists: [Artist] = [
    .billieEilish, .kanyeWest, .arianaGrande, .lanaDelRey,
    .bts, .drake, .harryStyles, Artist.oneDirection,
    .rihanna, .edSheeran, .theWeeknd, .duaLipa
]

let mockPodcasts: [Podcast] = [
    .rottenMango, .lastPodcastOnTheLeft, .moreInTrueCrime,
    .theJoeRoganExperience, Podcast.geeThanks, .moreInComedy,
    .distractible, .myBrotherMyBrotherAndMe, .moreInStories,
    .callHerDaddy, .itsALot, .moreInRelationships
]

let mockHomeRecentlyPlayed: [Media] = [
    .album(.oneRemastered), .artist(.lanaDelRey),
    .artist(.marvinGaye), .playlist(.indiePop),
    .podcast(.rottenMango), .artist(.bts) ,.podcast(.theJoeRoganExperience)
]

let mockLibraryRecentlyPlayed: [Media] = [
    .artist(.lolozouai), .artist(.lanaDelRey),
    .playlist(.frontLeft), .artist(.marvinGaye),
    .track(.les)
]

let mockRecentSearches: [Media] = [
    .artist(.fkaTwigs),
    .artist(.hozier),
    .artist(.grimes),
    .album(.oneRemastered),
    .artist(.hayes),
    .artist(.ledZeppelin),
    .track(.les),
    .playlist(.indiePop),
    .podcast(.distractible),
    .podcast(.moreInTrueCrime),
    .artist(.billieEilish),
    .podcast(.lastPodcastOnTheLeft),
    .artist(.edSheeran),
    .podcast(.geeThanks),
    .playlist(.edSheeranBigSeanJuiceWRLDPostMalone)
]

let mockEditorsPicks: [EditorsPick] = [
    EditorsPick(media: .playlist(.edSheeranBigSeanJuiceWRLDPostMalone)),
    EditorsPick(media: .playlist(.mitskiTameImpalaGlassAnimalsCharlieXCX)),
    EditorsPick(media: .playlist(.todaysTopHits)),
    EditorsPick(media: .track(.les)),
    EditorsPick(media: .artist(.fkaTwigs))
]

let mockTopGenres: [Genre] = [.pop, .indie]
let mockPopularGenres: [Genre] = [.newsAndPolitics, .comedy]
let mockGenres: [Genre] = [.wrapped2021, .podcasts, .madeForYou, .charts]


@main
struct SpotifyUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .preferredColorScheme(.dark)
        }
    }
}
