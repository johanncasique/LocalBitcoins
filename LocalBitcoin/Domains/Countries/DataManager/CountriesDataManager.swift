//
//  CountriesDataManager.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class CountriesDataManager: CountriesDataManagerProtocol {
    
    let countryService: CountriesServiceProtocol
    
    init(countryService: CountriesServiceProtocol) {
        self.countryService = countryService
    }
    
    func getCountries(completion: @escaping (CountriesDataManagerTypeResult) -> Void) {
        countryService.getCountries { result in
            switch result {
            case .failure:
                completion(.failure(.loadError))
            case .sucess(let countryData):
                completion(.sucess(countryData.data))
            }
        }
    }
}
