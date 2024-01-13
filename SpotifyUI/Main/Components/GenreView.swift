//
//  GenreView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/21/24.
//

import SwiftUI

struct GenreView: View {
    let genre: Genre
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            HStack(alignment: .bottom, spacing: 0) {
                title
                artwork
            }
            .frame(height: 109, alignment: .top)
            .background(Color(hex: genre.hexColor))
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

extension GenreView {
    var title: some View {
        ZStack {
            Text(genre.name)
                .font(Font.style.caption)
                .fontWeight(.heavy)
                .lineSpacing(6)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.white)
                .padding(16)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
    
    var artwork: some View {
        let size = CGSize(width: 66, height: 66)
        
        return ZStack {
            ZStack {
                Color(hex: "#1F1F21")
                if let image = genre.image {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width)
                        .clipped()
                } else {
                    Text(String("Album"))
                        .font(Font.style.caption4)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.white)
                }
            }
            .frame(width: size.width, height: size.height)
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .rotationEffect(Angle(degrees: 19.86))
            .offset(x: 16, y: -5)
            .shadow(color: Color.black.opacity(0.6), radius: 5)
        }
        .frame(alignment: .bottomTrailing)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GenreView(genre: Genre.comedy, onTapped: {})
}
