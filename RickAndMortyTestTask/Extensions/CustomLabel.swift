//
//  CustomLabel.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 18.08.2023.
//

import UIKit

final class CustomLabel: UILabel {
    
    // MARK: - Private Properties
    private var customText: String {
        didSet {
            text = customText
        }
    }
    
    private var customColor: UIColor {
        didSet {
            textColor = customColor
        }
    }
    
    private var customFont: UIFont {
        didSet {
            font = customFont
        }
    }
    
    // MARK: - Init
    init(customText: String = "", customColor: UIColor = .white, customFont: UIFont = UIFont.systemFont(ofSize: 17)) {
        self.customFont = customFont
        self.customText = customText
        self.customColor = customColor
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Private Methods
    private func setupLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        text = customText
        textColor = customColor
        font = customFont
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
    }
}

