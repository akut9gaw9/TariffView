//
//  OptionsCollectionViewCell.swift
//  CollectionCompositional
//
//  Created by Stanislav on 26.09.2023.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    static let identifier = "OptionsCollectionViewCell"
    
     // MARK: UI Components
    
    private let optionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray3
        label.numberOfLines = 0
        return label
    }()
    
    private let checkMarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "checkmark")
        return imageView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set constraints
    
    func setupConstraints() {
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        checkMarkImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(optionLabel)
        addSubview(checkMarkImageView)
        
        NSLayoutConstraint.activate([
            checkMarkImageView.topAnchor.constraint(equalTo: topAnchor),
            checkMarkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            checkMarkImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkMarkImageView.widthAnchor.constraint(equalToConstant: 25),
            
            optionLabel.topAnchor.constraint(equalTo: checkMarkImageView.topAnchor),
            optionLabel.leadingAnchor.constraint(equalTo: checkMarkImageView.trailingAnchor, constant: 15),
            optionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionLabel.bottomAnchor.constraint(equalTo: checkMarkImageView.centerYAnchor)
        ])
    }
    
    // MARK: Set setting for label
    
    func configureCell(textItem: String) {
        optionLabel.text = textItem
    }
}
