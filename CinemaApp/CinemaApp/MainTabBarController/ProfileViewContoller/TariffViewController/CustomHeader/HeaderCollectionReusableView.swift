//
//  HeaderCollectionReusableView.swift
//  CollectionCompositional
//
//  Created by Stanislav on 26.09.2023.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: Variables
    static let identifier = "HeaderCollectionReusableView"
    
    // MARK: UI Components
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    
    // MARK: Configure header
    
    func configureHeader(amountDays: String) {
        headerLabel.text = amountDays
    }
    
    // MARK: Set constraints
    
    private func setupConstraints() {
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
    }
    
}
