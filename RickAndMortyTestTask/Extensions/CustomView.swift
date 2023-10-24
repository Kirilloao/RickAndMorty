//
//  CustomView.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 18.08.2023.
//

import UIKit

final class CustomView: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupView() {
        self.backgroundColor = .greyColor
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
