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
        
        speciesValueLabel.text = "Human"
        speciesValueLabel.textColor = .white
        speciesValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return speciesValueLabel
        
    }()
    
    lazy var typeValueLabel: UILabel = {
        var typeValueLabel = UILabel()
        
        typeValueLabel.text = "None"
        typeValueLabel.textColor = .white
        typeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return typeValueLabel
        
    }()
    
    lazy var genderValueLabel: UILabel = {
        var genderValueLabel = UILabel()
        
        genderValueLabel.text = "Male"
        genderValueLabel.textColor = .white
        genderValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return genderValueLabel
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
        speciesValueLabel.text = character.species
        typeValueLabel.text = character.type
        genderValueLabel.text = character.gender
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(speciesLabel)
        mainView.addSubview(speciesValueLabel)
        mainView.addSubview(typeLabel)
        mainView.addSubview(typeValueLabel)
        mainView.addSubview(genderLabel)
        mainView.addSubview(genderValueLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // setup concstraints to mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // setup constraints to spaciesLabel
            speciesLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            speciesLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
         
            
            // setup constraints to spaciesValueLabel
            speciesValueLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            speciesValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            speciesValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // setup constraints to typeLabel
            typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 15),
            typeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // setup constraints to typeValueLabel
            typeValueLabel.topAnchor.constraint(equalTo: speciesValueLabel.bottomAnchor, constant: 15),
            typeValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            typeValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // setup constraints to genderLabel
            genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 15),
            genderLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // setup constraints to genderValueLabel
            genderValueLabel.topAnchor.constraint(equalTo: typeValueLabel.bottomAnchor, constant: 15),
            genderValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            genderValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
}
