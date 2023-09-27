//
//  NetworkService.swift
//  CinemaApp
//
//  Created by Stanislav on 19.09.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getData() -> [TariffModelJSON]
}

final class NetworkService: NetworkServiceProtocol {
    
    func getData() -> [TariffModelJSON] {
        return [
            TariffModelJSON(amountOfDays: 30,
                            price: 199,
                            description: "Тариф на 30 дней, часть фильмов доступна к бесплатному просмотру",
                            options: Array(repeating: "Какие-то опции", count: 10)),
            TariffModelJSON(amountOfDays: 90,
                            price: 549,
                            description: "Тариф на 90 дней, часть фильмов и сериалов доступна к бесплатному просмотру",
                            options: Array(repeating: "Какие-то опции", count: 15)),
            TariffModelJSON(amountOfDays: 365,
                            price: 1799,
                            description: "Тариф на 365 дней, все фильмы и сериал доступны к бесплатному просмотру",
                            options: Array(repeating: "Какие-то опции", count: 20))
                
        ]
    }
}
