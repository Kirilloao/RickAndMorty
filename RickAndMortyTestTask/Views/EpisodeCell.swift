//
//  EpisodeCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private lazy var mainView: CustomView = {
        var mainView = CustomView()
        
        return mainView
    }()
    
    // MARK: - Public UI Properties
    lazy var nameEpisodeLabel: CustomLabel = {
        var nameEpisode = CustomLabel(
            customFont: UIFont.boldSystemFont(ofSize: 18)
        )
        
        return nameEpisode
    }()
    
    lazy var episodeNumberLabel: CustomLabel = {
        var episodeNumberLabel = CustomLabel(
            customColor: .greenColor,
            customFont: UIFont.systemFont(ofSize: 15)
        )
        
        return episodeNumberLabel
    }()
    
    lazy var dateLabel: CustomLabel = {
        var dateLabel = CustomLabel(
            customColor: .dateLabel,
            customFont: UIFont.systemFont(ofSize: 14)
        )
        
        return dateLabel
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
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
                self?.episodeNumberLabel.text = self?.formatEpisodeNumber(episode.episode)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(nameEpisodeLabel)
        mainView.addSubview(episodeNumberLabel)
        mainView.addSubview(dateLabel)
    }
    
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
    
    func formatEpisodeNumber(_ episodeNumber: String) -> String {
        if let seasonRange = episodeNumber.range(of: "S(\\d{2})", options: .regularExpression),
           let episodeRange = episodeNumber.range(of: "E(\\d{2})", options: .regularExpression) {
            
            let seasonNumber = String(Int(episodeNumber[seasonRange].dropFirst()) ?? 0)
            let episodeNumber = String(Int(episodeNumber[episodeRange].dropFirst()) ?? 0)
            
            return "Episode: \(episodeNumber), Season: \(seasonNumber)"
        } else {
            return episodeNumber
        }
    }
}
