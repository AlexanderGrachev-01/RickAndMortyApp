//
//  RMCharacter.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import Foundation

struct RMCharacter: Codable {
    let id: String
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: RMCharacterGander
    let origin: RMOrigin
    let location: RMSingleLocation
    let imageURL: String
    let episode: [String]
    let url: String
    let created: String
}

