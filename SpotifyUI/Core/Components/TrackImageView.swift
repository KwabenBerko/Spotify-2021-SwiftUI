//
//  TrackImageView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/12/24.
//

import SwiftUI

struct TrackImageView: View {
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
    TrackImageView(
        image: "Les",
        size: CGSize(width: 110, height: 110)
    )
}

