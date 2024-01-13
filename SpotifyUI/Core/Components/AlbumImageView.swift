//
//  AlbumImageView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/11/24.
//

import SwiftUI

struct AlbumImageView: View {
    let image: String?
    let size: CGSize
    
    var body: some View {
        ZStack {
            if let image = image {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width)
                    .clipped()
                
            } else {
                Rectangle()
                    .foregroundStyle(Color.black)
            }

        }
        .frame(width: size.width, height: size.height)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlbumImageView(
        image: Album.oneRemastered.image,
        size: CGSize(width: 110, height: 110)
    )
}
