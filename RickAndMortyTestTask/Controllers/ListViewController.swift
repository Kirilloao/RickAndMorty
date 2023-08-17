//
//  ListViewController.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

final class ListViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private var rickAndMorty: RickAndMorty?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        view.backgroundColor = .black
        
        fetchCharacters(from: Links.rickAndMortyURL.rawValue)
        setupNavigationBar()
    }
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navBarAppearance.backgroundColor = .black
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
    
    private func setupCollectionView() {
        collectionView.register(
            CharacterCell.self,
            forCellWithReuseIdentifier: "characterCell"
        )
        
        collectionView.backgroundColor = .clear
    }
}

// MARK: - UICollectionViewDataSource
extension ListViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
        
        let character = rickAndMorty?.results[indexPath.row]
        
        cell.configure(with: character)
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 202)
    }
}

// MARK: - Networking
extension ListViewController {
    private func fetchCharacters(from url: String) {
        NetworkManager.shared.fetch(RickAndMorty.self, from: url) { [weak self] result in
            switch result {
                
            case .success(let rickAndMorty):
                self?.rickAndMorty = rickAndMorty
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
