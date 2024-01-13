//
//  ArtistImageView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/10/24.
//

import SwiftUI

struct ArtistImageView: View {
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
        .clipShape(Circle())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ArtistImageView(
        image: "BillieEilish",
        size: CGSize(width: 100, height: 100)
    )
}
