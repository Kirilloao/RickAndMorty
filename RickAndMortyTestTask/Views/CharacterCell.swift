//
//  CharacterCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainView
    }()
    
    lazy var characterImageView: UIImageView = {
        var characterImage = UIImageView()
        
        characterImage.layer.cornerRadius = 15
        characterImage.clipsToBounds = true
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        
        return characterImage
    }()
    
    lazy var characterNameLabel: UILabel = {
        var characterName = UILabel()
        
        characterName.font = UIFont.boldSystemFont(ofSize: 16)
        characterName.numberOfLines = 2
        characterName.textColor = .white
        characterName.textAlignment = .center
        characterName.translatesAutoresizingMaskIntoConstraints = false
        
        return characterName
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubview(characterImageView)
        mainView.addSubview(characterNameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // setup constraints to mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // setup constraints to characterImageView
            characterImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            characterImageView.heightAnchor.constraint(equalToConstant: 140),
            
            // setup constraints to nameLabel
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 10),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor)
        ])
    }
    
    // MARK: - Public Methods
    func configure(with character: Character?) {
        characterNameLabel.text = character?.name
        
        NetworkManager.shared.fetchImage(from: character?.image ?? "") { [weak self] result in
            switch result {
                
            case .success(let image):
                self?.characterImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
