//
//  MainView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/25/24.
//

import SwiftUI

struct HomeState: Equatable {
    var recentlyPlayed: [Media] = []
    var editorsPicks: [EditorsPick] = []
}

let mockHomeState = HomeState(
    recentlyPlayed: mockHomeRecentlyPlayed,
    editorsPicks: mockEditorsPicks
)

struct HomeView: View {
    
    @State private var state = mockHomeState
    
    var body: some View {
        HomeContentView(state: $state)
    }
}

struct HomeContentView: View {
    
    @Binding var state: HomeState
    
    var body: some View {
        GeometryReader { geometry in
            Color.theme.background
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    Spacer().frame(height: 8)
                    
                    recentlyPlayedList
                    
                    Spacer().frame(height: 18)
                    
                    wrapped
                    
                    Spacer().frame(height: 18)
                    
                    editorsPicksList
                    
                    Spacer().frame(height: 8)
                }
            }
        }
    }
}

private struct WrappedItemView: View {
    let title: String
    let image: String
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Spacer().frame(height: 12)
                
                Text(title)
                    .font(Font.style.caption3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
            }
        }
    }
}

private extension HomeContentView {
    var recentlyPlayedList: some View {
        let size = CGSize(width: 105, height: 105)
        return ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(state.recentlyPlayed, id: \.id) { recent in
                    switch recent {
                    case .track(let track):
                        TrackView(track: track, size: size, onTapped: {})
                    case .artist(let artist):
                        ArtistView(artist: artist, size: size, onTapped: {})
                    case .playlist(let playlist):
                        PlaylistView(playlist: playlist, size: size, onTapped: {})
                    case .album(let album):
                        AlbumView(album: album, size: size, onTapped: {})
                    case .podcast(let podcast):
                        PodcastView(podcast: podcast, size: size, onTapped: {})
                    }
                }
                
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
    
    var wrapped: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                Image("SpotifyWrappedIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 58, height: 58)
                
                VStack(alignment: .leading) {
                    Text(String("#SPOTIFYWRAPPED"))
                        .font(Font.style.footnote2)
                        .fontWeight(.regular)
                        .foregroundStyle(Color(hex: "#9C9C9C"))
                    
                    Text(String(localized: "Your 2021 in review"))
                        .font(Font.style.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
            }
            
            Spacer().frame(height: 16)
            
            HStack(spacing: 10) {
                WrappedItemView(
                    title: String(localized: "Your Top Songs 2021"),
                    image: "SpotifyWrappedTopSongs",
                    onTapped: {}
                )
                
                WrappedItemView(
                    title: String(localized: "Your Artists Revealed"),
                    image: "SpotifyWrappedArtists",
                    onTapped: {}
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
    }
    
    var editorsPicksList: some View {
        let size = CGSize(width: 150, height: 150)
        
        return VStack(alignment: .leading, spacing: 8) {
            
            Text(String(localized: "Editor's Picks"))
                .font(Font.style.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.leading, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 10) {
                    ForEach(state.editorsPicks, id: \.id) { pick in
                        EditorsPickView(pick: pick, size: size, onTapped: {})
                    }
                    
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeContentView(state: .constant(mockHomeState))
}
