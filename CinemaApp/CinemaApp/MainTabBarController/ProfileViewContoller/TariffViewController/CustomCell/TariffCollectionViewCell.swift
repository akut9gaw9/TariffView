//
//  TarrifsCollectionViewCell.swift
//  CollectionCompositional
//
//  Created by Stanislav on 26.09.2023.
//

import UIKit

final class TariffCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    static let identifier = "TariffCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            isSelected ? tariffIsSelected() : tariffIsUnselected()
        }
    }
    
    // MARK: UI Components
    
    private let tariffUIViewForSelectedLabel: UIView = {
        let uiView = UIView()
        uiView.contentMode = .center
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = UIColor.systemGray3.cgColor
        uiView.layer.cornerRadius = 10.0
        return uiView
    }()
    
    private let tariffDaysIsSelectedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let tariffDaysLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let tariffPriceBoldLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "TariffPriceColor")
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    private let tariffPricePerDay: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure UI Components from data
    
    func configureCell(item: TariffModel){
        tariffDaysIsSelectedLabel.text = "\(item.numberOfDays) дней"
        tariffDaysLabel.text = "\(item.numberOfDays) дней"
        tariffPriceBoldLabel.text = "\(item.tariffPrice)₽"
        tariffPricePerDay.text = "\(item.priceForOneDay)₽ В ДЕНЬ"
    }
    
}


// MARK: Setup constraints and view settings

private extension TariffCollectionViewCell {
    
    // MARK: Setup Constraints
    
    func setupConstraints() {
        tariffUIViewForSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        tariffDaysIsSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        tariffDaysLabel.translatesAutoresizingMaskIntoConstraints = false
        tariffPriceBoldLabel.translatesAutoresizingMaskIntoConstraints = false
        tariffPricePerDay.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tariffUIViewForSelectedLabel)
        tariffUIViewForSelectedLabel.addSubview(tariffDaysIsSelectedLabel)
        addSubview(tariffDaysLabel)
        addSubview(tariffPriceBoldLabel)
        addSubview(tariffPricePerDay)
        
        NSLayoutConstraint.activate([
            tariffUIViewForSelectedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            tariffUIViewForSelectedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tariffUIViewForSelectedLabel.widthAnchor.constraint(equalToConstant: 70),
            tariffUIViewForSelectedLabel.heightAnchor.constraint(equalToConstant: 30),
            
            tariffDaysIsSelectedLabel.centerXAnchor.constraint(equalTo: tariffUIViewForSelectedLabel.centerXAnchor),
            tariffDaysIsSelectedLabel.centerYAnchor.constraint(equalTo: tariffUIViewForSelectedLabel.centerYAnchor),
            
            tariffDaysLabel.topAnchor.constraint(equalTo: tariffUIViewForSelectedLabel.bottomAnchor, constant: 30),
            tariffDaysLabel.leadingAnchor.constraint(equalTo: tariffUIViewForSelectedLabel.leadingAnchor),
            tariffDaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            tariffDaysLabel.bottomAnchor.constraint(equalTo: tariffPriceBoldLabel.topAnchor),
            
            tariffPriceBoldLabel.topAnchor.constraint(equalTo: tariffDaysLabel.bottomAnchor),
            tariffPriceBoldLabel.leadingAnchor.constraint(equalTo: tariffDaysLabel.leadingAnchor),
            tariffPriceBoldLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tariffPricePerDay.topAnchor.constraint(equalTo: tariffPriceBoldLabel.bottomAnchor, constant: 10),
            tariffPricePerDay.trailingAnchor.constraint(equalTo: trailingAnchor),
            tariffPricePerDay.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            tariffPricePerDay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
        ])
    }
    
    // MARK: Setup view setting
    
    func setViews() {
        backgroundColor = UIColor(named: "TariffCellBackground")
        layer.borderColor = UIColor(named: "TariffPriceColor")?.cgColor
        layer.shadowColor = UIColor(named: "TariffPriceColor")?.cgColor
        layer.shadowRadius = 10
        layer.cornerRadius = 10
    }
    
    
}

// MARK: Methods for action selected cell

private extension TariffCollectionViewCell {
    
    func tariffIsSelected() {
        tariffUIViewForSelectedLabel.layer.borderWidth = 1
        tariffUIViewForSelectedLabel.layer.borderColor = UIColor(named: "TariffPriceColor")?.cgColor
        tariffUIViewForSelectedLabel.backgroundColor = UIColor(named: "TariffPriceColor")
        tariffDaysIsSelectedLabel.textColor = .white
        layer.borderWidth = 1
        layer.shadowOpacity = 1.0
        
    }
    
    func tariffIsUnselected() {
        tariffUIViewForSelectedLabel.layer.borderWidth = 1
        tariffUIViewForSelectedLabel.layer.borderColor = UIColor.systemGray3.cgColor
        tariffUIViewForSelectedLabel.backgroundColor = .none
        tariffDaysIsSelectedLabel.textColor = .systemGray3
        layer.borderWidth = 0
        layer.shadowOpacity = 0.0
    }
    
}
