//
//  SelectableView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/11/24.
//

import SwiftUI

struct SelectionOverlayView<Content: View>: View {
    
    let isSelected: Bool
    let content: () -> Content
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            content()
            if isSelected {
                overlay
            }
        }
    }
}

private extension SelectionOverlayView {
    var overlay: some View {
        ZStack {
            Color.white
            Image(systemName: "checkmark")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
        }
        .frame(width: 30, height: 30)
        .clipShape(Circle())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SelectionOverlayView(isSelected: true) {
        Circle()
            .foregroundStyle(Color.red)
            .frame(width: 100, height: 100)
    }
}

