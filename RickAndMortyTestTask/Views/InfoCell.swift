//
//  InfoCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private lazy var mainView: CustomView = {
        var mainView = CustomView()
        return mainView
    }()
    
    private lazy var speciesLabel: CustomLabel = {
        var speciesLabel = CustomLabel(
            customText: "Species:",
            customColor: .greylabel
        )
        return speciesLabel
    }()
    
    private lazy var typeLabel: CustomLabel = {
        var typeLabel = CustomLabel(
            customText: "Type:",
            customColor: .greylabel
        )
        return typeLabel
    }()
    
    private lazy var genderLabel: CustomLabel = {
        var genderLabel = CustomLabel(
            customText: "Gender",
            customColor: .greylabel
        )
        return genderLabel
    }()
    
    // MARK: - Public UI Properties
    lazy var speciesValueLabel: CustomLabel = {
        var speciesValueLabel = CustomLabel(customColor: .white)
        return speciesValueLabel
    }()
    
    lazy var typeValueLabel: CustomLabel = {
        var typeValueLabel = CustomLabel(customColor: .white)
        return typeValueLabel
    }()
    
    lazy var genderValueLabel: CustomLabel = {
        var genderValueLabel = CustomLabel(customColor: .white)
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
        typeValueLabel.text = character.type.isEmpty ? "None" : character.type
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
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            speciesLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            speciesLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
         
            speciesValueLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            speciesValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            speciesValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 15),
            typeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            typeValueLabel.topAnchor.constraint(equalTo: speciesValueLabel.bottomAnchor, constant: 15),
            typeValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            typeValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 15),
            genderLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genderValueLabel.topAnchor.constraint(equalTo: typeValueLabel.bottomAnchor, constant: 15),
            genderValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            genderValueLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
