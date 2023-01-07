//
//  RMEpisode.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import Foundation

struct RMEpisode: Codable {
    let id: String
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
