//
//  MainView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/7/24.
//

import SwiftUI

enum Tab {
    case home
    case search
    case library
}

struct BottomTabView: View {
    @Binding var activeTab: Tab
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            nowPlaying
                .padding(.horizontal, 6)
            bottomBar
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
        }
        .background(Color.clear)
        .ignoresSafeArea(.all)
    }
}

extension BottomTabView {
    
    private var artwork: some View {
        ZStack {
            Color.black
            Image("OneRemastered")
                .resizable()
                .scaledToFill()
        }
        .frame(width: 36, height: 36)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
    
    private var track: some View {
        Text(String("From Me to You - Mono/Remastered • The Beetles"))
            .font(Font.style.caption3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .lineLimit(1)
            .fixedSize(horizontal: false, vertical: false)
            .clipped()
    }
    
    private var trackProgress: some View {
        ProgressView(value: 0.53, total: 1)
            .background(Color(hex: "#5E2432"))
            .tint(Color(hex: "#B2B2B2"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 8)
            .progressViewStyle(.linear)
            .offset(y: -4)
    }
    
    private var bluetoothIcon: some View {
        Image("BluetoothIcon")
            .resizable()
            .scaledToFit()
    }
    
    private var bluetoothDevice: some View {
        HStack(alignment: .center, spacing: 0) {
            bluetoothIcon
                .frame(width: 6)
            
            Spacer().frame(width: 6)
            
            Text(String("BEATSPILL+"))
                .font(Font.style.footnote2)
                .fontWeight(.regular)
                .foregroundStyle(Color.theme.primary)
        }
    }
    
    private var pauseButton: some View {
        Button(action: {}) {
            Image("PauseIcon")
                .resizable()
                .frame(width: 16, height: 20)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
    
    var nowPlaying: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                artwork
                
                Spacer().frame(width: 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    track
                    
                    Spacer().frame(height: 2)
                    
                    bluetoothDevice
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    bluetoothIcon
                        .frame(width: 12)
                    
                    Spacer().frame(width: 22)
                    
                    pauseButton
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
            .padding(.bottom, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(hex: "#370D17"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            trackProgress
        }
    }
    
    var bottomBar: some View {
        let tabs = [Tab.home, Tab.search, Tab.library]
        return HStack {
            ForEach(tabs, id: \.self) { tab in
                Button(action: { activeTab = tab }) {
                    TabItemView(
                        tab: tab,
                        isSelected: activeTab == tab
                    )
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .background(Color.theme.background)
    }
}

struct TabItemView: View {
    let tab: Tab
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(tab.image)
                .renderingMode(.template)
            
            Text(tab.title)
                .font(Font.style.caption3)
                .fontWeight(.regular)
        }
        .foregroundStyle(
            isSelected ? Color.white : Color.theme.neutral
        )
    }
}

struct MainView: View {
    @EnvironmentObject private var navigator: MainNavigator
    
    var body: some View {
        MainContentView(
            onRecentSearchesTapped: {
                navigator.push(.recents)
            }
        )
    }
}

struct MainContentView: View {
    @State private var activeTab: Tab = .home
    let onRecentSearchesTapped: () -> Void
    
    init(onRecentSearchesTapped: @escaping () -> Void) {
        self.onRecentSearchesTapped = onRecentSearchesTapped
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TabView(selection: $activeTab) {
                HomeView().tag(Tab.home)
                SearchView().tag(Tab.search)
                LibraryView().tag(Tab.library)
            }
            
            BottomTabView(activeTab: $activeTab)
        }
        .background(Color.theme.background)
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.theme.background, for: .navigationBar)
        .toolbar(
            activeTab == Tab.home ? .visible : .hidden,
            for: .navigationBar
        )
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                title
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 14) {
                    bellIcon
                    recentsIcon
                    settingsIcon
                }
                .foregroundStyle(Color.white)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

private extension Tab {
    var title: String {
        switch self {
        case .home:
            String(localized: "Home")
        case .search:
            String(localized: "Search")
        case .library:
            String(localized: "Your Library")
        }
    }
    
    var image: String {
        switch self {
        case .home:
            "HomeIcon"
        case .search:
            "SearchIcon"
        case .library:
            "LibraryIcon"
        }
    }
}

private extension MainContentView {
    var title: some View {
        Text(String(localized: "Recently played"))
            .font(Font.style.title4)
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
            .animation(nil)
    }
    
    var bellIcon: some View {
        Button(action: {}){
            Image("NotificationsIcon")
        }
    }
    
    var recentsIcon: some View {
        Button(action: onRecentSearchesTapped){
            Image("RecentsIcon")
        }
    }
    
    var settingsIcon: some View {
        Button(action: {}){
            Image("SettingsIcon")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        MainContentView(onRecentSearchesTapped: {})
    }
}
