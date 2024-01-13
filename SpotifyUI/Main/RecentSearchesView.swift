//
//  RecentsView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import SwiftUI

struct RecentSearchesState: Equatable {
    var searchText: String = ""
    var searches: [Media] = []
}

let mockRecentSearchesState = RecentSearchesState(
    searchText: "",
    searches: mockRecentSearches
)

struct RecentSearchesView: View {
    
    @EnvironmentObject private var navigator: MainNavigator
    @State private var state = mockRecentSearchesState
    
    var body: some View {
        RecentSearchesContentView(
            state: $state,
            onBackTapped: navigator.pop,
            onRecentSearchTapped: { _ in }
        )
    }
}

struct RecentSearchesContentView: View {
    @FocusState private var focusState: Bool
    @Binding var state: RecentSearchesState
    let onBackTapped: () -> Void
    let onRecentSearchTapped: (Media) -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                searchBar
                
                Spacer().frame(height: 36)
                
                recentSearches
            }
            .padding(.top, 8)
            .padding(.horizontal, 16)
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                focusState = true
            }
        }
    }
}

private extension RecentSearchesContentView {
    var searchBar: some View {
        HStack(spacing: 8) {
            SearchTextView(
                searchText: $state.searchText,
                textColor: Color.white,
                backgroundColor: Color(hex: "#282828"),
                fontWeight: .medium,
                cornerRadius: 10,
                padding: 8
            )
            .focused($focusState)
            
            Button(action: onBackTapped) {
                Text(String(localized: "Cancel"))
                    .font(Font.style.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var recentSearches: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text(String(localized: "Recent searches"))
                .font(Font.style.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            
            Spacer().frame(height: 16)
            
            MediaListView(
                mediaList: state.searches,
                onMediaTapped: onRecentSearchTapped
            )
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        RecentSearchesContentView(
            state: .constant(mockRecentSearchesState),
            onBackTapped: {},
            onRecentSearchTapped: { _ in }
        )
    }
}
