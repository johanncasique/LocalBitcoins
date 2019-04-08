//
//  CountriesInteractorProtocol.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum CountriesInteractorError: Error {
    case loadError
    case networkError
}

typealias CountriesInteractorTypeResult = Result<[Country], CountriesInteractorError>

protocol CountriesInteractorProtocol {
    func geCountries(with completion: @escaping (CountriesInteractorTypeResult) -> Void)
}
