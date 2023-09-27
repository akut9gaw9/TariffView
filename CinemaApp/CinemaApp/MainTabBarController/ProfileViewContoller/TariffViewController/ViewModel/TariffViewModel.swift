//
//  TariffViewModel.swift
//  CollectionCompositional
//
//  Created by Stanislav on 25.09.2023.
//

import Foundation
import UIKit

final class TariffViewModel {
    
    // MARK: Variables
    
    private let networkService: NetworkServiceProtocol = NetworkService()
    var sections = [CollectionViewModel]()
    var selectedItem: TariffModel?
    
    // MARK: Initialization
    
    init() {
        fetchData()
    }
    
    // MARK: Fetch data from Network Service

    private func fetchData() {
        let result = networkService.getData()
        sections.append(.tariffs(result.map({TariffModel(numberOfDays: $0.amountOfDays, tariffPrice: $0.price, tariffDescription: $0.description, tariffOptions: $0.options)})))
        sections.append(.description(result.map({TariffModel(numberOfDays: $0.amountOfDays, tariffPrice: $0.price, tariffDescription: $0.description, tariffOptions: $0.options)})))
        sections.append(.options(result.map({TariffModel(numberOfDays: $0.amountOfDays, tariffPrice: $0.price, tariffDescription: $0.description, tariffOptions: $0.options)})))
    }
    
    // MARK: Create CompositionalLayout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = sections[sectionIndex]
            switch section {
            case .tariffs(_):
                return createTariffsSection()
            case .description(_):
                return createDescriptionSection()
            case .options(_):
                return createOptionsSection()
            }
        }

    }
    
}


// MARK: - Methods for building collectionView in TariffViewController

extension TariffViewModel {
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        guard let selectedItem = selectedItem else {
            switch section {
            case 0:
                return sections[section].count
            default:
                return 0
            }
        }
        switch section {
        case 0:
            return sections[section].count
        case 2:
            return selectedItem.tariffOptions.count
        default:
            return 1
        }
    }
    
    func cellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .tariffs(let item):
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TariffCollectionViewCell.identifier, for: indexPath) as? TariffCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
                return cell
            }
            cell.configureCell(item: item[indexPath.row])
            return cell
            
        case .description(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCollectionViewCell.identifier, for: indexPath) as? DescriptionCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
                return cell
            }
            guard let selectedItem = selectedItem else { return UICollectionViewCell() }
            cell.configureCell(item: selectedItem)
            return cell
            
        case .options(_):
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCollectionViewCell.identifier, for: indexPath) as? OptionCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
                return cell
            }
            guard let selectedItem = selectedItem else { return UICollectionViewCell() }
            let tariffOption = selectedItem.tariffOptions[indexPath.row]
            cell.configureCell(textItem: tariffOption)
            return cell
        }
    }
    
    
    
}

// MARK: - Create Collection View Header

extension TariffViewModel {
    
    func createHeaderForDescriptionSection(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                               for: indexPath) as? HeaderCollectionReusableView
            else {
                return UICollectionReusableView()
            }
            guard let selectedItem = selectedItem else {
                header.configureHeader(amountDays: "")
                return header
            }
            let amountDays = "\(selectedItem.numberOfDays) дней"
            header.configureHeader(amountDays: amountDays)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func createHeaderForOptionSection(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                               for: indexPath) as? HeaderCollectionReusableView
            else {
                return UICollectionReusableView()
            }
            guard let _ = selectedItem else {
                header.configureHeader(amountDays: "")
                return header
            }
            header.configureHeader(amountDays: "Что входит в тариф")
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

// MARK: - Create Compositional Layout

private extension TariffViewModel {
    
    // MARK: Layout for tariffs section
    
    func createTariffsSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.30),
                                                            heightDimension: .estimated(50)))
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(7), top: .fixed(6), trailing: .fixed(5), bottom: .fixed(6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                         heightDimension: .estimated(50)),
                                                       subitems: [item])
//        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 0,
                                          supplementaryItems: [])
        section.contentInsets = .init(top: 20, leading: 0, bottom: 50, trailing: 0)
        return section
        
    }
    
    // MARK: Layout for description section
    
    func createDescriptionSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                            heightDimension: .estimated(30)))
        item.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                       heightDimension: .estimated(30)),
                                                     subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10.0,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 15, leading: 0, bottom: 20, trailing: 0)
        return section
    }
    
    // MARK: Layout for options section
    
    func createOptionsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                            heightDimension: .estimated(30)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                       heightDimension: .estimated(100)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 20,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 18, leading: 0, bottom: 30, trailing: 0)
        return section
    }
    
    // MARK: Layout for section
    
    func createLayoutSection(group: NSCollectionLayoutGroup,
                             behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                             interGroupSpacing: CGFloat,
                             supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    
    // MARK: Layout for header
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}


