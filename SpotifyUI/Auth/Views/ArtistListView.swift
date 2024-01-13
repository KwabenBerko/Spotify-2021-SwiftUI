//
//  ArtistsView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct ArtistListView: View {
    @Binding var searchText: String
    @Binding var artists: [Artist]
    let onArtistTapped: (Artist) -> Void
    let onDoneTapped: () -> Void
    
    var body: some View {
        return ZStack {
            VStack {
                SearchTextView(searchText: $searchText)
                
                Spacer().frame(height: 20)
                
                artistsGrid
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 16)
        .overlay(alignment: .bottom) {
            if showDoneButton {
                doneButton
            }
        }
    }
}

private extension ArtistListView {
    var artistsGrid: some View {
        let columns = [GridItem(.adaptive(minimum: 85), spacing: 16)]
        
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(artists, id: \.name) { artist in
                    ArtistView(artist: artist) {
                        onArtistTapped(artist)
                    }
                }
            }
        }
    }
    
    var doneButton: some View {
        SignupButtonView(
            text: String(localized: "Done"),
            enabled: true,
            onTap: onDoneTapped
        )
        .padding(.bottom, 12)
    }
    
    var showDoneButton: Bool {
        let count = artists
            .filter { $0.isSelected }
            .count
        
        return count >= 3
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ArtistListView(
        searchText: .constant(""),
        artists: .constant(mockArtists),
        onArtistTapped: { _ in },
        onDoneTapped: {}
    )
    .background(Color.theme.background)
}
