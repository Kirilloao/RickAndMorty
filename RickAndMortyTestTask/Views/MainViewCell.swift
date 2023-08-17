//
//  MainViewCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    lazy var characterImageView: UIImageView = {
        var characterImage = UIImageView()
        
        characterImage.layer.cornerRadius = 15
        characterImage.clipsToBounds = true
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.image = UIImage(named: "12")
        
        return characterImage
    }()
    
    lazy var characterNameLabel: UILabel = {
        var characterName = UILabel()
        
        characterName.text = "Rick Sanches"
        characterName.font = UIFont.boldSystemFont(ofSize: 20)
        characterName.numberOfLines = 2
        characterName.textColor = .white
        characterName.textAlignment = .center
        characterName.translatesAutoresizingMaskIntoConstraints = false
        
        return characterName
    }()
    
    lazy var characterStatusLabel: UILabel = {
        var characterStatusLabel = UILabel()
        
        characterStatusLabel.text = "Alive"
        characterStatusLabel.textColor = #colorLiteral(red: 0.2818226516, green: 0.7749570012, blue: 0.04761204123, alpha: 1)
        characterStatusLabel.font = UIFont.systemFont(ofSize: 15)
        characterStatusLabel.numberOfLines = 2
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
    
    // MARK: Private Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            // setup constraints to characterImageView
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 150),
            
            // setup constraints to nameLabel
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            
            // setup constraints to characterStatusLabel
            characterStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 8),
            characterStatusLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterStatusLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor)
        ])
    }
}
