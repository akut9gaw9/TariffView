//
//  DescriptionCollectionViewCell.swift
//  CollectionCompositional
//
//  Created by Stanislav on 26.09.2023.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    static let identifier = "DescriptionCollectionViewCell"
    
    // MARK: UI Components
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray3
        label.numberOfLines = 0
        return label
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
    
    private func setupConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: Configure cell from fetch data
    
    func configureCell(item: TariffModel) {
        descriptionLabel.text = item.tariffDescription
    }
    
 }
