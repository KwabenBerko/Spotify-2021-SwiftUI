//
//  Font.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import Foundation
import SwiftUI

extension Font {
    static let style = FontStyle()
}

private let avenir = "Avenir Next Cyr"
struct FontStyle {
    let title = Font.custom(avenir, size: 28)
    let title2 = Font.custom(avenir, size: 26)
    let title3 = Font.custom(avenir, size: 22)
    let title4 = Font.custom(avenir, size: 20)
    let caption = Font.custom(avenir, size: 16)
    let caption2 = Font.custom(avenir, size: 14)
    let caption3 = Font.custom(avenir, size: 13)
    let caption4 = Font.custom(avenir, size: 12)
    let footnote = Font.custom(avenir, size: 11)
    let footnote2 = Font.custom(avenir, size: 10)
}
