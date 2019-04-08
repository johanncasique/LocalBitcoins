//
//  CountriesServiceProtocol.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum CountriesServiceError: Error {
    case invalidURL
    case noCountryData
    case invalidData
    case networkError(Error)
}

typealias CountriesServiceResult = Result<Countries, CountriesServiceError>

protocol CountriesServiceProtocol {
    func getCountries(completion: @escaping (CountriesServiceResult) -> Void)
}
