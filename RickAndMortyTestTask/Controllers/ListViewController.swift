//
//  ListViewController.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

final class ListViewController: UICollectionViewController {
    
    // MARK: - Private UI Properties
    private lazy var previousBarButton: UIBarButtonItem = {
        var previousButton = createBarButton(
            "Previous page",
            action: #selector(updateData(_:))
        )
        
        return previousButton
    }()
    
    private lazy var nextBarButton: UIBarButtonItem = {
        var nextButton = createBarButton(
            "Next page",
            action: #selector(updateData(_:))
        )
        
        return nextButton
    }()
    
    // MARK: - Private Properties
    private var rickAndMorty: RickAndMorty?
    private var currentPage = 1 {
        didSet {
            if currentPage == 1 {
                previousBarButton.isEnabled = false
            }
        }
    }
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        view.backgroundColor = .black
        previousBarButton.isEnabled = false
        
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
    
    // MARK: - Private Actions
    @objc private func updateData(_ sender: UIBarButtonItem) {
        if sender == nextBarButton {
            fetchCharacters(from: rickAndMorty?.info.next ?? "")
            currentPage += 1
            
            if currentPage == 43 {
                nextBarButton.isEnabled = false
            }
            previousBarButton.isEnabled = true
        } else {
            fetchCharacters(from: rickAndMorty?.info.prev ?? "")
            if currentPage > 1 {
                currentPage -= 1
            }
        }
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
        
        navigationItem.leftBarButtonItem = previousBarButton
        navigationItem.rightBarButtonItem = nextBarButton
    }
    
    private func setupCollectionView() {
        collectionView.register(
            CharacterCell.self,
            forCellWithReuseIdentifier: "characterCell"
        )
        
        collectionView.backgroundColor = .clear
    }
    
    private func createBarButton(_ title: String, action: Selector) -> UIBarButtonItem {
        let previousButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: action
        )
        previousButton.tintColor = .white
        
        return previousButton
    }
}

// MARK: - UICollectionViewDataSource
extension ListViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "characterCell",
                for: indexPath) as? CharacterCell
        else {
            return UICollectionViewCell()
        }
        
        let character = rickAndMorty?.results[indexPath.row]
        
        cell.configure(with: character)
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 202)
    }
}

// MARK: - UICollectionViewDelegate
extension ListViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = rickAndMorty?.results[indexPath.row]
        
        let detailsVC = DetailsViewController()
        detailsVC.character = selectedCharacter
        
        navigationController?.pushViewController(detailsVC, animated: true)
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
