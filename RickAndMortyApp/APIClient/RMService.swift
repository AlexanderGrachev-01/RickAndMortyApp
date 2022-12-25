//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute(_ request: RMRequest, complition: @escaping () -> Void) {
        
    }
}
