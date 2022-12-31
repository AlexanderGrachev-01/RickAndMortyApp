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
    
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    complition: @escaping (Result<T, Error>) -> Void) {
        
    }
}
