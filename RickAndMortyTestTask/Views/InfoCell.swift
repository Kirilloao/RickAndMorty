//
//  InfoCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        
        
        return mainView
    }()
    
    private lazy var speciesLabel: UILabel = {
        var speciesLabel = UILabel()
        
        speciesLabel.text = "Species:"
        speciesLabel.textColor = #colorLiteral(red: 0.7689349651, green: 0.7886797786, blue: 0.80892694, alpha: 1)
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return speciesLabel
        
    }()
    
    private lazy var typeLabel: UILabel = {
        var typeLabel = UILabel()
        
        typeLabel.text = "Type:"
        typeLabel.textColor = #colorLiteral(red: 0.7689349651, green: 0.7886797786, blue: 0.80892694, alpha: 1)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return typeLabel
        
    }()
    
    private lazy var genderLabel: UILabel = {
        var genderLabel = UILabel()
        
        genderLabel.text = "Gender:"
        genderLabel.textColor = #colorLiteral(red: 0.7689349651, green: 0.7886797786, blue: 0.80892694, alpha: 1)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return genderLabel
        
    }()
    
    // MARK: - Public UI Properties
    lazy var speciesValueLabel: UILabel = {
        var speciesValueLabel = UILabel()
        
        speciesValueLabel.text = "Human:"
        speciesValueLabel.textColor = #colorLiteral(red: 0.7689349651, green: 0.7886797786, blue: 0.80892694, alpha: 1)
        speciesValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return speciesValueLabel
        
    }()
    
    lazy var typeValueLabel: UILabel = {
        var typeValueLabel = UILabel()
        
        typeValueLabel.text = "Gender:"
        typeValueLabel.textColor = #colorLiteral(red: 0.7689349651, green: 0.7886797786, blue: 0.80892694, alpha: 1)
        typeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return typeValueLabel
        
    }()
    
    lazy var genderValueLabel: UILabel = {
        var genderValueLabel = UILabel()
        
        genderValueLabel.text = "Gender:"
        genderValueLabel.textColor = #colorLiteral(red: 0.7689349651, green: 0.7886797786, blue: 0.80892694, alpha: 1)
        genderValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return genderValueLabel
    }()
    
//    private lazy var mainStackView: UIStackView = {
//        var mainStackView = UIStackView()
//
//        mainStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        return mainStackView
//
//    }()
    
    
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // setup concstraints to main
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
