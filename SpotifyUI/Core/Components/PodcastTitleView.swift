//
//  PodcastTitleView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/11/24.
//

import SwiftUI

struct PodcastTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(Font.style.caption4)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .lineSpacing(5)
            .lineLimit(2, reservesSpace: true)
            .multilineTextAlignment(.center)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PodcastTitleView(title: String("A Podcast Title"))
        .background(Color.red)
}
