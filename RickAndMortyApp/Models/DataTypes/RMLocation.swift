//
//  RMLocation.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import Foundation

struct RMLocation: Codable {
    let id: String
    let name: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
