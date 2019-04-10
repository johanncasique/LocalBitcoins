//
//  CountriesInteractor.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class CountriesInteractor: CountriesInteractorProtocol {
    
    let dataManager: CountriesDataManagerProtocol
    
    init(dataManager: CountriesDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func geCountries(with completion: @escaping (CountriesInteractorTypeResult) -> Void) {
        
        dataManager.getCountries { result in
            
            switch result {
            case .failure(let error):
                print(error)
                
            case .sucess(let countryData):
                let countryArray = countryData.countryList.compactMap { Country(isoCode:$0) }
                completion(.sucess(countryArray))
            }
            
        }
    }
    
    
}
