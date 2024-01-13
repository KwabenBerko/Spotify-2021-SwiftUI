//
//  MainNavigator.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/18/24.
//

import Foundation

final class MainNavigator: Navigator<MainDestination> {
    
    static let shared = MainNavigator()

}

enum MainDestination: Hashable {
    case recents
}
