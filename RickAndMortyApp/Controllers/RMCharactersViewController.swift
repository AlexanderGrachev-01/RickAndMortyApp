//
//  RMCharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import UIKit

final class RMCharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character,
                                queryParamets: [
                                URLQueryItem(name: "name", value: "rick"),
                                URLQueryItem(name: "status", value: "alive")
                                ])
   
    }
}
