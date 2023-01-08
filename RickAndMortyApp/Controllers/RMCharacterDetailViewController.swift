//
//  RMCharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 09.01.2023.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    
    private var viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        view.backgroundColor = .systemBackground
    }
}
