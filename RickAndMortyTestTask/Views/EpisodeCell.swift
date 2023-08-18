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
        
        mainView.backgroundColor = .greyColor
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        
        return mainView
    }()
    
    // MARK: - Public UI Properties
    lazy var nameEpisodeLabel: UILabel = {
        var nameEpisode = UILabel()
        
        nameEpisode.textColor = .white
        nameEpisode.font = UIFont.boldSystemFont(ofSize: 18)
        nameEpisode.translatesAutoresizingMaskIntoConstraints = false
        nameEpisode.adjustsFontSizeToFitWidth = true
        nameEpisode.minimumScaleFactor = 0.5
        
        return nameEpisode
    }()
    
    lazy var episodeNumberLabel: UILabel = {
        var episodeNumberLabel = UILabel()
        
        episodeNumberLabel.textColor = .greenColor
        episodeNumberLabel.font = UIFont.systemFont(ofSize: 15)
        episodeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return episodeNumberLabel
    }()
    
    lazy var dateLabel: UILabel = {
        var dateLabel = UILabel()
        
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
    
    // MARK: - Public Methods
    func configure(_ episodeURL: String) {
        NetworkManager.shared.fetch(Episode.self, from: episodeURL) { [weak self] result in
            switch result {
            case .success(let episode):
                self?.nameEpisodeLabel.text = episode.name
                self?.dateLabel.text = episode.airDate
                
                if let seasonRange = episode.episode.range(of: "S(\\d{2})", options: .regularExpression),
                   let episodeRange = episode.episode.range(of: "E(\\d{2})", options: .regularExpression) {
                    
                    let seasonNumber = String(Int(episode.episode[seasonRange].dropFirst()) ?? 0)
                    let episodeNumber = String(Int(episode.episode[episodeRange].dropFirst()) ?? 0)
                    
                    let formattedEpisode = "Episode: \(episodeNumber), Season: \(seasonNumber)"
                    self?.episodeNumberLabel.text = formattedEpisode
                } else {
                    self?.episodeNumberLabel.text = episode.episode
                }
                
            case .failure(let error):
                print(error)
            }
        }
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
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            
            episodeNumberLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),
            episodeNumberLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            
            dateLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15)
        ])
    }
}
