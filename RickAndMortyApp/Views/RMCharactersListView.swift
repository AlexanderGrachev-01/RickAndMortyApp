//
//  RMCharactersListView.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 08.01.2023.
//

import UIKit

protocol RMCharactersListViewDelegate: AnyObject {
    func rmCharactersListView(_ charactersListView: RMCharactersListView, didSelectCharacter: RMCharacter)
}

class RMCharactersListView: UIView {
    
    private let viewModel = RMCharactersListViewViewModel()
    
    public weak var delegate: RMCharactersListViewDelegate?
    
    private let spinner: UIActivityIndicatorView = {
        $0.style = .large
        $0.hidesWhenStopped = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIActivityIndicatorView())
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isHidden = true
        view.alpha = 0
        view.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellidentifier)
        view.register(RMFooterLoadingCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(spinner, collectionView)
        setConstraint()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

extension RMCharactersListView: RMCharactersListViewViewModelDelegate {
    func didLoadInitialCharacters() {
        collectionView.reloadData()
        spinner.stopAnimating()
        collectionView.isHidden = false
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
    
    func didSelectCharater(_ character: RMCharacter) {
        delegate?.rmCharactersListView(self, didSelectCharacter: character)
    }
    
    func didLoadMoreCharacters(with newIndexPaths: [IndexPath]) {
        collectionView.performBatchUpdates {
            self.collectionView.insertItems(at: newIndexPaths)
        }
    }
}
