//
//  RMCharactersListViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 08.01.2023.
//

import UIKit

final class RMCharactersListViewViewModel: NSObject {
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageURL: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    public func fetchCharacters() {
        RMService.shared.execute(
            .listCharactersRequest,
            expecting: RMGetAllCharactersResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let result = responseModel.results
                self?.characters = result
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharactersListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellidentifier,
            for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsuppotred cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
}

extension RMCharactersListViewViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}

extension RMCharactersListViewViewModel: UICollectionViewDelegateFlowLayout {
    
}
