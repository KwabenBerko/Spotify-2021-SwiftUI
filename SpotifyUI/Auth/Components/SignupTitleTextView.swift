//
//  SignupTitleTextView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/23/24.
//

import SwiftUI

struct SignupTitleTextView: View {
    let text: String
    
    var body: some View {
        Text(text).font(Font.style.title3)
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SignupTitleTextView(text: "Some title text goes here")
        .background(Color.theme.background)
}
