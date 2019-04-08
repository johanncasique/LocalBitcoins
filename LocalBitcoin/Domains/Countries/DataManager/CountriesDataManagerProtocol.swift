//
//  CountriesDataManagerProtocol.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum CountriesDataManagerError: Error {
    case loadError
}

typealias CountriesDataManagerTypeResult = Result<Countries, CountriesDataManagerError>

protocol CountriesDataManagerProtocol {
    func getCountries(completion: @escaping (CountriesDataManagerTypeResult) -> Void)
}
