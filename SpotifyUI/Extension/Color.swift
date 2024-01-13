//
//  Color.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    init(hex: String) {
            var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
            var rgb: UInt64 = 0
            
            Scanner(string: cleanHexCode).scanHexInt64(&rgb)
            
            let redValue = Double((rgb >> 16) & 0xFF) / 255.0
            let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
            let blueValue = Double(rgb & 0xFF) / 255.0
            self.init(red: redValue, green: greenValue, blue: blueValue)
        }
}

struct ColorTheme {
    let background = Color("BackgroundColor")
    let primary = Color("PrimaryColor")
    let neutral = Color("NeutralColor")
}
