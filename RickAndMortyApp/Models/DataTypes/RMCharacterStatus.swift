//
//  RMCharacterStatus.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 31.12.2022.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
