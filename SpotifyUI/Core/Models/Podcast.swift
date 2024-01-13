//
//  Podcast.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import Foundation

enum PodcastArtwork: Equatable {
    case image(_ url: String)
    case color(_ hex: String)
    
    var isImage: Bool {
        if case .image(_) = self {
            return true
        } else {
            return false
        }
    }
}

struct Podcast: Equatable {
    var id: String = UUID().uuidString
    var title: String
    var artwork: PodcastArtwork
    var isSelected: Bool = false
    var isEditorsPick: Bool = false
}

extension Podcast {
    static let rottenMango = Podcast(title: "Rotten Mango", artwork: .image("RottenMango"))
    static let lastPodcastOnTheLeft = Podcast(title: "Last Podcast On The Left", artwork: .image("LastPodcastOnTheLeft"))
    static let moreInTrueCrime = Podcast(title: "More in True Crime", artwork: .color("#C92D5C"))
    static let theJoeRoganExperience = Podcast(title: "The Joe Rogan Experience", artwork: .image("TheJoeRoganExperience"))
    static let geeThanks = Podcast(title: "Gee Thanks", artwork: .image("GeeThanks"))
    static let moreInComedy = Podcast(title: "More in Comedy", artwork: .color("#75150D"))
    static let distractible = Podcast(title: "Distractible", artwork: .image("Distractible"))
    static var myBrotherMyBrotherAndMe = Podcast(title: "My Brother, My Brother And Me", artwork: .image("MyBrotherMyBrotherAndMe"))
    static let moreInStories = Podcast(title: "More in Stories", artwork: .color("#0D2916"))
    static let callHerDaddy = Podcast(title: "Call Her Daddy", artwork: .image("CallHerDaddy"))
    static let itsALot = Podcast(title: "It's A Lot", artwork: .image("ItsALot"))
    static let moreInRelationships = Podcast(title: "More in Relationships", artwork: .color("#2C3D60"))
}
