//
//  RMGetCharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 31.12.2022.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    let info: RMGetCharactersResponseInfo
    let results: [RMCharacter]
}
