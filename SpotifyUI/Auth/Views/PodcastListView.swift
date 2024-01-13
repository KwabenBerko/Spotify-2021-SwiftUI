//
//  PodcastsView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct PodcastListView: View {
    @Binding var searchText: String
    @Binding var podcasts: [Podcast]
    let onPodcastTapped: (Podcast) -> Void
    let onDoneTapped: () -> Void
    
    var body: some View {
        return ZStack {
            VStack(alignment: .leading) {
                headerTitle
                
                Spacer().frame(height: 10)
                
                SearchTextView(searchText: $searchText)
                
                Spacer().frame(height: 24)
                
                podcastsGrid
            }
        }
        .modifier(SignupLayoutModifier())
        .overlay(alignment: .bottom) {
            doneButton
        }
    }
}



private extension PodcastListView {
    var headerTitle: some View {
        Text(String(localized: "Now choose some podcasts."))
            .font(Font.style.title2)
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
    }
    
    var podcastsGrid: some View {
        let columns = [GridItem(.adaptive(minimum: 85), spacing: 16)]
        
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(podcasts, id: \.title) { podcast in
                    PodcastView(podcast: podcast) {
                        onPodcastTapped(podcast)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    
    var doneButton: some View {
        SignupButtonView(
            text: String(localized: "Done"),
            enabled: true,
            onTap: onDoneTapped
        )
        .padding(.bottom, 12)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    PodcastListView(
        searchText: .constant(""),
        podcasts: .constant(mockPodcasts),
        onPodcastTapped: {_ in },
        onDoneTapped: {}
    )
}
