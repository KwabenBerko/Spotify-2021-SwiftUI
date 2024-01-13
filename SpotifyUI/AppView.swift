//
//  RootView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/10/24.
//

import SwiftUI

struct AppView: View {
    @State private var isLoggedIn: Bool = false
    @StateObject private var authNavigator = AuthNavigator.shared
    @StateObject private var mainNavigator = MainNavigator.shared
    private let useCase = IsUserLoggedIn.shared
    
    var body: some View {
        Group {
            if !isLoggedIn {
                NavigationStack(path: $mainNavigator.path)  {
                    MainView()
                        .navigationDestination(for: MainDestination.self) { destination in
                            switch destination {
                            case .recents: RecentSearchesView()
                            }
                        }
                }
                .environmentObject(mainNavigator)
            } else {
                NavigationStack(path: $authNavigator.path) {
                    StartView()
                        .navigationDestination(for: SignupDestination.self) { destination in
                            switch destination {
                            case .signup: SignupView()
                            }
                        }
                }
                .environmentObject(authNavigator)
            }
        }
        .animation(.easeOut, value: isLoggedIn)
        .onReceive(useCase.execute()){
            isLoggedIn = $0
        }
    }
}
