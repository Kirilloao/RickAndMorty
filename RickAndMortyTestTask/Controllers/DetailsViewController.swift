//
//  DetailsViewController.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class DetailsViewController: UICollectionViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        collectionView.register(
            MainViewCell.self,
            forCellWithReuseIdentifier: "cell"
        )
        
        collectionView.register(
            SectionHeaderReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier
        )
        
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "cell2"
        )
        
        collectionView.register(
            InfoCell.self,
            forCellWithReuseIdentifier: "infoCell"
        )
        
        collectionView.backgroundColor = .clear
    }
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 80, bottom: 0, right: 80)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UICollectionViewDataSource
extension DetailsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        return 4
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if section == 3 {
            return 10
        } else {
            return 1
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainViewCell else { return UICollectionViewCell() }
         
        
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as? InfoCell else { return UICollectionViewCell() }
        
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
         
        
            return cell
        }
     
    }
    
   override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier, for: indexPath) as! SectionHeaderReusableView
                
                // Проверяем, для какой секции добавляем заголовок и устанавливаем текст
                if indexPath.section == 1 {
                    headerView.titleLabel.text = "Your Section Title"
                } else {
                    headerView.titleLabel.text = "" // Пустой заголовок для остальных секций
                }
                
                return headerView
            }
            
            return UICollectionReusableView()
        }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 150, height: 202)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 130)
        }
    
    }
}
