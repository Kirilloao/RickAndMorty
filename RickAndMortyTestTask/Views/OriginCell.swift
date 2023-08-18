//
//  OriginCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class OriginCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private lazy var mainView: CustomView = {
        var mainView = CustomView()

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
    
    private lazy var planetLabel: CustomLabel = {
        var planetLabel = CustomLabel(
            customText: "Planet",
            customColor: .greenColor,
            customFont: UIFont.systemFont(ofSize: 15)
        )

        return planetLabel
    }()
    
    lazy var planetValueLabel: CustomLabel = {
        var planetValueLabel = CustomLabel(
            customFont: UIFont.boldSystemFont(ofSize: 17)
        )

        return planetValueLabel
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
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
    private func addViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(squareView)
        squareView.addSubview(earthImageView)
        mainView.addSubview(planetValueLabel)
        mainView.addSubview(planetLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            squareView.heightAnchor.constraint(equalToConstant: 64),
            squareView.widthAnchor.constraint(equalToConstant: 64),
            squareView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            squareView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            earthImageView.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            earthImageView.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            
            planetValueLabel.topAnchor.constraint(equalTo: squareView.topAnchor, constant: 5),
            planetValueLabel.leadingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: 15),
            
            planetLabel.bottomAnchor.constraint(equalTo: squareView.bottomAnchor, constant: -7),
            planetLabel.leadingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: 15)
        ])
    }
}
