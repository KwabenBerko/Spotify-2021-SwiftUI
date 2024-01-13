//
//  Navigator.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/8/24.
//

import Foundation
import SwiftUI

class Navigator<T: Hashable>: ObservableObject {
        
    @Published var path: NavigationPath = .init()
    
    func push(_ destination: T) {
        path.append(destination)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
}
