//
//  CharacterCell.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    private lazy var mainView: CustomView = {
        var mainView = CustomView()
        return mainView
    }()
    
    private lazy var characterImageView: CustomImageView = {
        var characterImage = CustomImageView()
        return characterImage
    }()
    
    private lazy var characterNameLabel: UILabel = {
        var characterName = UILabel()
        characterName.font = UIFont.boldSystemFont(ofSize: 16)
        characterName.numberOfLines = 2
        characterName.textColor = .white
        characterName.textAlignment = .center
        characterName.translatesAutoresizingMaskIntoConstraints = false
        return characterName
    }()
    
    private var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Private Properties
    private var imageURL: URL? {
        didSet {
            characterImageView.image = nil
            updateImage()
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        activityIndicator = showSpinner(in: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with character: Character?) {
        characterNameLabel.text = character?.name
        imageURL = URL(string: character?.image ?? "")
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubview(characterImageView)
        mainView.addSubview(characterNameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            characterImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            characterImageView.heightAnchor.constraint(equalToConstant: 140),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 10),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor)
        ])
    }
    
    private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        // Get image from cache
        if let cachedImage = ImageCacheManager.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cachedImage))
            return
        }
        
        // Download image from url
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let imageData):
                guard let uiImage = UIImage(data: imageData) else { return }
                ImageCacheManager.shared.setObject(uiImage, forKey: url.lastPathComponent as NSString)
                
                completion(.success(uiImage))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateImage() {
        guard let imageURL = imageURL else { return }
        
        getImage(from: imageURL) { [weak self] result in
            switch result {
                
            case .success(let image):
                if imageURL == self?.imageURL {
                    self?.characterImageView.image = image
                    self?.activityIndicator?.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        view.addSubview(activityIndicator)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: characterImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor)
        ])
        
        return activityIndicator
    }
}
