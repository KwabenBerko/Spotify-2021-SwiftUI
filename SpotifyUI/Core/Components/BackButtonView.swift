//
//  BackButtonView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/14/24.
//

import SwiftUI

struct BackButtonView: View {
    
    let onTapped: () -> Void
    
    var body: some View {
        Button(
            action: onTapped,
            label: {
                Image(systemName: "chevron.backward")
            }
        )
        .buttonStyle(.plain)
        .padding(12)
        .background(Circle().foregroundStyle(Color.black))
        .foregroundStyle(Color.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BackButtonView(onTapped: {})
}
