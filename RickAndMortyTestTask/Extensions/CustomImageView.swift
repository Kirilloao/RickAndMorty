//
//  CustomImageView.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 18.08.2023.
//

import UIKit

final class CustomImageView: UIImageView{
    
    // MARK: - init
    init() {
        super.init(frame: .zero)
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
    }
    
    // MARK: - Private Methods
    private func setupImageView() {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
