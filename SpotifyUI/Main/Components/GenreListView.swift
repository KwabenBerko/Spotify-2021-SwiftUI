//
//  GenreListView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/21/24.
//

import SwiftUI

struct GenreListView: View {
    let genres: [Genre]
    let onGenreTapped: (Genre) -> Void
    
    var body: some View {
        genresGrid
    }
}

extension GenreListView {
    
    var genresGrid: some View {
        let columns = [
            GridItem(.adaptive(minimum: 160), spacing: 10)
        ]
        return LazyVGrid(columns: columns) {
            ForEach(genres, id: \.id) { genre in
                GenreView(genre: genre) {
                    onGenreTapped(genre)
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GenreListView(
        genres: mockTopGenres + mockPopularGenres + mockGenres,
        onGenreTapped: {_ in }
    )
}
