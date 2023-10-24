//
//  MainViewCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

final class MainViewCell: UICollectionViewCell {
    
    lazy var characterImageView: CustomImageView = {
        var characterImage = CustomImageView()
        return characterImage
    }()
    
    lazy var characterNameLabel: UILabel = {
        var characterName = UILabel()
        characterName.font = UIFont.boldSystemFont(ofSize: 20)
        characterName.numberOfLines = 2
        characterName.textColor = .white
        characterName.textAlignment = .center
        characterName.translatesAutoresizingMaskIntoConstraints = false
        return characterName
    }()
    
    lazy var characterStatusLabel: UILabel = {
        var characterStatusLabel = UILabel()
        characterStatusLabel.textColor = .greenColor
        characterStatusLabel.font = UIFont.systemFont(ofSize: 15)
        characterStatusLabel.textAlignment = .center
        characterStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        return characterStatusLabel
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterStatusLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(_ character: Character) {
        characterNameLabel.text = character.name
        characterStatusLabel.text = character.status
        
        guard let imageURL = URL(string: character.image) else { return }
        
        NetworkManager.shared.fetchImage(from: imageURL) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Private Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 150),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            
            characterStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 8),
            characterStatusLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterStatusLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor)
        ])
    }
}
