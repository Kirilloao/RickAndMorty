//
//  OriginCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class OriginCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        
        
        return mainView
    }()
    
    private lazy var squareView: UIView = {
        var squareView = UIView()
        
        squareView.backgroundColor = #colorLiteral(red: 0.09701510519, green: 0.1106951013, blue: 0.162830621, alpha: 1)
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.layer.cornerRadius = 10
        squareView.clipsToBounds = true
        
        
        return squareView
    }()
    
    private lazy var earthImageView: UIImageView = {
        var earthImageView = UIImageView()
        
        earthImageView.image = UIImage(named: "earth")
        earthImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return earthImageView
        
    }()
    
    private lazy var planetLabel: UILabel = {
        var planetLabel = UILabel()
        
        planetLabel.textColor = #colorLiteral(red: 0.2818226516, green: 0.7749570012, blue: 0.04761204123, alpha: 1)
        planetLabel.text = "Planet"
        planetLabel.font = UIFont.systemFont(ofSize: 15)
        planetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return planetLabel
    }()
    
    lazy var planetValueLabel: UILabel = {
        var planetValueLabel = UILabel()
        
        planetValueLabel.font = UIFont.boldSystemFont(ofSize: 17)
        planetValueLabel.textColor = .white
        planetValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return planetValueLabel
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainView)
        mainView.addSubview(squareView)
        squareView.addSubview(earthImageView)
        mainView.addSubview(planetValueLabel)
        mainView.addSubview(planetLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(_ character: Character) {
        planetValueLabel.text = character.location.name
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
           // setup constraints to mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // setup constraints to squareView
            squareView.heightAnchor.constraint(equalToConstant: 64),
            squareView.widthAnchor.constraint(equalToConstant: 64),
            squareView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            squareView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            // setup constraints to earthImageView
            earthImageView.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            earthImageView.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            
            // setup constraints to planetValueLabel
            planetValueLabel.topAnchor.constraint(equalTo: squareView.topAnchor, constant: 5),
            planetValueLabel.leadingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: 15),
            
            // setup constraints to planetLabel
            planetLabel.bottomAnchor.constraint(equalTo: squareView.bottomAnchor, constant: -7),
            planetLabel.leadingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: 15)
            
        ])
    }
}