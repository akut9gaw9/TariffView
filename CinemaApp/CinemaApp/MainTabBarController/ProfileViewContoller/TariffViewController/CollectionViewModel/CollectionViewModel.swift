//
//  CollectionViewModel.swift
//  CollectionCompositional
//
//  Created by Stanislav on 25.09.2023.
//

import Foundation

enum CollectionViewModel {
    case tariffs([TariffModel])
    case description([TariffModel])
    case options([TariffModel])
    
    var items: [TariffModel] {
        switch self {
        case .tariffs(let items), .description(let items), .options(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        
        case .tariffs:
            return ""
        case .description:
            return "\(items[0].numberOfDays) дней"
        case .options:
            return "Что входит в тариф"
        }
    }
    
}
