//
//  CustomLabel.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 18.08.2023.
//

import UIKit

class CustomLabel: UILabel {
    var customText: String {
        didSet {
            text = customText
        }
    }
    
     var customColor: UIColor {
        didSet {
            textColor = customColor
        }
    }
    
    var customFont: UIFont {
        didSet {
            font = customFont
        }
    }
    
    
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
    
    private func setupLabel() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = customText
        self.textColor = customColor
        self.font = customFont
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        
    }
}

