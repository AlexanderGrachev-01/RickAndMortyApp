//
//  RMCharactersListViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 08.01.2023.
//

import UIKit

final class RMCharactersListViewViewModel: NSObject {
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("URL: " + String(model.results.first?.image ?? ""))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharactersListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellidentifier,
            for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsuppotred cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Alex",
                                                               characterStatus: .alive,
                                                               characterImageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
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
