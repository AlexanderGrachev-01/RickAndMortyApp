//
//  RMGetCharactersResponseInfo.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 31.12.2022.
//

import Foundation

struct RMGetCharactersResponseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
