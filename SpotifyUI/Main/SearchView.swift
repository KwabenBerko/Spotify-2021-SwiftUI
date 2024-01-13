//
//  SearchView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/19/24.
//

import SwiftUI


struct SearchState {
    var searchText: String = ""
    var topGenres: [Genre] = []
    var popularGenres: [Genre] = []
    var genres: [Genre] = []
}

let mockSearchState = SearchState(
    searchText: "",
    topGenres: mockTopGenres,
    popularGenres: mockPopularGenres,
    genres: mockGenres
)

struct SearchView: View {
    @State private var state = mockSearchState
    
    var body: some View {
        SearchContentView(
            state: $state,
            onGenreTapped: {genre in }
        )
    }
}

private struct SearchContentView: View {
    @Binding var state: SearchState
    let onGenreTapped: (Genre) -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                VStack {
                    header
                    
                    Spacer().frame(height: 20)
                    
                    searchBar
                }
                .padding(.horizontal, 16)
                
                Spacer().frame(height: 22)
                
                ScrollView {
                    yourTopGenres
                    
                    Spacer().frame(height: 26)
                    
                    popularGenres
                    
                    Spacer().frame(height: 26)
                    
                    otherGenres
                }
                .scrollIndicators(.hidden)
            }
            .padding(.top, 10)
        }
    }
}

private struct GenresSectionView: View {
    let title: String
    let genres: [Genre]
    let onGenreTapped: (Genre) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(Font.style.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            
            Spacer().frame(height: 16)
            
            GenreListView(
                genres: genres,
                onGenreTapped: onGenreTapped
            )
        }
        .padding(.horizontal, 16)
    }
}

extension SearchContentView {
    var header: some View {
        HStack {
            Text(String(localized: "Search"))
                .font(Font.style.title2)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
            
            Spacer()
            
            Button(action: {}) {
                cameraIcon
            }
            
        }
        .frame(maxWidth: .infinity)
    }
    
    var cameraIcon: some View {
        Image("CameraIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 29)
    }
    
    var searchBar: some View {
        SearchTextView(
            searchText: $state.searchText,
            placeholderText: String(localized: "Artists, songs or podcasts"),
            textColor: Color(hex: "#131313"),
            iconSize: CGSize(width: 20, height: 20),
            padding: 10
        )
    }
    
    var yourTopGenres: some View {
        GenresSectionView(
            title: String(localized: "Your top genres"),
            genres: state.topGenres,
            onGenreTapped: onGenreTapped
        )
    }
    
    var popularGenres: some View {
        GenresSectionView(
            title: String(localized: "Popular podcast categories"),
            genres: state.popularGenres,
            onGenreTapped: onGenreTapped
        )
    }
    
    var otherGenres: some View {
        GenresSectionView(
            title: String(localized: "Browse all"),
            genres: state.genres,
            onGenreTapped: onGenreTapped
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchContentView(
        state: .constant(mockSearchState),
        onGenreTapped: {_ in }
    )
}
