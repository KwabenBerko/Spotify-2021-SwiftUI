//
//  IsUserLoggedIn.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 2/18/24.
//

import Foundation
import Combine

class IsUserLoggedIn {
    
    let subject = CurrentValueSubject<Bool, Never>(false)
    
    static let shared = IsUserLoggedIn()
    private init() {}
    
    func execute() -> AnyPublisher<Bool, Never> {
        return subject
            .eraseToAnyPublisher()
    }
}
