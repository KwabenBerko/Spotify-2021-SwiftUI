//
//  SignupNavigator.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/18/24.
//

import Foundation

enum SignupDestination: Hashable {
    case signup
}

class AuthNavigator: Navigator<SignupDestination> {
    static let shared = AuthNavigator()
}
