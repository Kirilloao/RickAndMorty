//
//  DetailsViewController.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class DetailsViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private var episode: Episode!
    
    // MARK: - Public Properties
    var character: Character!
    

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        collectionView.register(
            MainViewCell.self,
            forCellWithReuseIdentifier: "cell"
        )
        
        collectionView.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.reuseIdentifier
        )
        
 
        
        collectionView.register(
            OriginCell.self,
            forCellWithReuseIdentifier: "originCell"
        )
        
        collectionView.register(
            InfoCell.self,
            forCellWithReuseIdentifier: "infoCell"
        )
        
        collectionView.register(
            EpisodeCell.self,
            forCellWithReuseIdentifier: "episodeCell"
        )
        
        collectionView.backgroundColor = .clear
    }
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20 , left: 60, bottom: 0, right: 60)
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
            return character.episode.count
        } else {
            return 1
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainViewCell else { return UICollectionViewCell() }
            
            cell.configure(character)
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as? InfoCell else { return UICollectionViewCell() }
            
            cell.configure(character)
            
            return cell
        } else if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "originCell", for: indexPath) as? OriginCell else { return UICollectionViewCell() }
            
            cell.configure(character)

            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath) as? EpisodeCell else { return UICollectionViewCell() }
            
            let episode = character.episode[indexPath.row]
            
            cell.configure(episode)

            return cell
        }
     
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 150, height: 220)
        } else if indexPath.section == 1 {
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 120)
        } else if indexPath.section == 2 {
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 80)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 86)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            if section == 0 {
                return UIEdgeInsets(top: 20, left: 60, bottom: 20, right: 60)
            } else {
                return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
            }
        }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           if kind == UICollectionView.elementKindSectionHeader {
               let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseIdentifier, for: indexPath) as! SectionHeaderView
               
            
               if indexPath.section == 1 {
                   headerView.titleLabel.text = "Info"
               } else if indexPath.section == 2 {
                   headerView.titleLabel.text = "Origin"
               } else if indexPath.section == 3 {
                   headerView.titleLabel.text = "Episodes"
               }
               
               return headerView
           }
           
           return UICollectionReusableView()
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
      CGSize(width: collectionView.bounds.width, height: 20)
    }
}

// MARK: - Networking
extension DetailsViewController {
    private func fetchEpisode(from url: String) {
        NetworkManager.shared.fetch(Episode.self, from: url) { [weak self] result in
            switch result {
            case .success(let episode):
                self?.episode = episode
            case .failure(let error):
                print(error)
            }
        }
    }
}
