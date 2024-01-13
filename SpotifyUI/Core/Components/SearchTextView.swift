//
//  SearchTextView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct SearchTextView: View {
    @Binding var searchText: String
    var placeholderText: String = String(localized: "Search")
    var textColor: Color = Color.black
    var backgroundColor: Color = Color.white
    var fontWeight: Font.Weight = .medium
    var iconSize: CGSize = CGSize(width: 14, height: 14)
    var cornerRadius: CGFloat = 5
    var padding: CGFloat = 14
    
    var body: some View {
        HStack {
            Image("SearchIcon")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize.width, height: iconSize.height)
                .foregroundStyle(textColor)
            
            TextField(
                String(""),
                text: $searchText,
                prompt: Text(placeholderText)
                    .foregroundStyle(textColor)
            )
        }
        .font(Font.style.caption)
        .fontWeight(fontWeight)
        .padding(padding)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .tint(textColor)
        .foregroundStyle(textColor)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchTextView(searchText: .constant(""))
}
