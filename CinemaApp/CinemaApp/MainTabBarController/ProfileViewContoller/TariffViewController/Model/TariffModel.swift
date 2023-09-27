//
//  TariffModel.swift
//  CollectionCompositional
//
//  Created by Stanislav on 25.09.2023.
//

import Foundation

struct TariffModel {
    let numberOfDays: Int
    let tariffPrice: Int
    let tariffDescription: String
    let tariffOptions: [String]
    
    var priceForOneDay: Double {
        let doubleValue = (Double(tariffPrice) / Double(numberOfDays))
        return round(doubleValue * 100) / 100.0
    }
}
