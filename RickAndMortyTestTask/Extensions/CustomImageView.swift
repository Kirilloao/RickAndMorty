//
//  CustomImageView.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 18.08.2023.
//

import UIKit

class CustomImageView: UIImageView{
    
    init() {
        super.init(frame: .zero)
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
    }
    
    private func setupImageView() {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
