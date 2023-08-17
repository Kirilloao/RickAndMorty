//
//  SectionHeaderReusableView.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeaderReusableView"
     
     let titleLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 18)
         label.textColor = .white // Цвет текста заголовка
         return label
     }()
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         addSubview(titleLabel)
         // Добавьте настройку расположения titleLabel внутри заголовка
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
