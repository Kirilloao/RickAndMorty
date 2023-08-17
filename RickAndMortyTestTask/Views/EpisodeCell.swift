//
//  EpisodeCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        
        return mainView
    }()
    
    lazy var nameEpisodeLabel: UILabel = {
        var nameEpisode = UILabel()
        
        nameEpisode.text = "Pilot"
        nameEpisode.textColor = .white
        nameEpisode.font = UIFont.boldSystemFont(ofSize: 19)
        nameEpisode.translatesAutoresizingMaskIntoConstraints = false
        
        return nameEpisode
    }()
    
    lazy var episodeNumberLabel: UILabel = {
        var episodeNumberLabel = UILabel()
        
        episodeNumberLabel.textColor = #colorLiteral(red: 0.2818226516, green: 0.7749570012, blue: 0.04761204123, alpha: 1)
        episodeNumberLabel.text = "Episode: 1, Season: 1"
        episodeNumberLabel.font = UIFont.systemFont(ofSize: 15)
        episodeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return episodeNumberLabel
    }()
    
    lazy var dateLabel: UILabel = {
        var dateLabel = UILabel()
        
        dateLabel.text = "December 2, 2013"
        dateLabel.textColor = UIColor(red: 0.577, green: 0.595, blue: 0.613, alpha: 1)
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return dateLabel
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainView)
        mainView.addSubview(nameEpisodeLabel)
        mainView.addSubview(episodeNumberLabel)
        mainView.addSubview(dateLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameEpisodeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            
            episodeNumberLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),
            episodeNumberLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            
            dateLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15)
        ])
    }
}
