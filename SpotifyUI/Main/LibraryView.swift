//
//  LibraryView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 3/10/24.
//

import SwiftUI

struct LibraryState {
    var filters: [String] = []
    var recentlyPlayed: [Media] = []
}

let mockLibraryState = LibraryState(
    filters: ["Playlists", "Artists", "Albums", "Podcasts & shows"],
    recentlyPlayed: mockLibraryRecentlyPlayed
)

struct LibraryView: View {
    @State private var state = mockLibraryState
    
    var body: some View {
        LibraryContentView(
            state: $state,
            onFilterTapped: { _ in },
            onRecentlyPlayedTapped: { _ in }
        )
    }
}

private struct LibraryContentView: View {
    @Binding var state: LibraryState
    let onFilterTapped: (String) -> Void
    let onRecentlyPlayedTapped: (Media) -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                Spacer().frame(height: 28)
                
                FiltersListView(
                    filters: state.filters,
                    onFilterTapped: onFilterTapped
                )
                
                Spacer().frame(height: 20)
                
                VStack {
                    recentlyPlayedHeader
                    
                    Spacer().frame(height: 16)
                    
                    MediaListView(
                        mediaList: state.recentlyPlayed,
                        onMediaTapped: onRecentlyPlayedTapped
                    )
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

private struct FiltersListView: View {
    let filters: [String]
    let onFilterTapped: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filters, id: \.self) { filter in
                    ChipView(title: filter) {
                        onFilterTapped(filter)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

private extension LibraryContentView {
    var header: some View {
        HStack(alignment: .center, spacing: 0) {
            profileImage
            
            Spacer().frame(width: 8)
            
            Text(String(localized: "Your Library"))
                .font(Font.style.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            
            Spacer()
            
            Button(action: {}) {
                addIcon
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var profileImage: some View {
        ZStack {
            Image("Profile")
                .resizable()
                .scaledToFill()
        }
        .frame(width: 35, height: 35)
        .background(Color.black)
        .clipShape(Circle())
    }
    
    var addIcon: some View {
        Image("AddIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 29)
    }
    
    var recentlyPlayedHeader: some View {
        HStack {
            Button(action: {}) {
                sortIcon
                Spacer().frame(width: 4)
                Text(String(localized: "Recently played"))
                    .font(Font.style.caption4)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
            }
            
            Spacer()
            
            Button(action: {}) {
                gridIcon
            }
        }
    }
    
    var sortIcon: some View {
        Image("SortIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 17)
    }
    var gridIcon: some View {
        Image("GridIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 16)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LibraryContentView(
        state: .constant(mockLibraryState),
        onFilterTapped: { _ in },
        onRecentlyPlayedTapped: { _ in }
    )
}
