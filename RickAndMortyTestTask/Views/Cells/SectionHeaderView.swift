//
//  SectionHeaderReusableView.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    
    // MARK: - Static Properties
    static let reuseIdentifier = "SectionHeaderView"
    
    private let titleLabel: CustomLabel = {
        let label = CustomLabel(
            customFont: UIFont.boldSystemFont(ofSize: 18)
        )
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func setTitle(_ text: String?) {
        titleLabel.text = text
    }
    
    // MARK: - Private Methods
    private func setViews() {
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
