//
//  Environment.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class Environment: EnvironmentProtocol {
    
    let webService = WebService()
    
    lazy var vendorsDataManager: VendorsDataManagerProtocol = {
        let loadUrlString = "/buy-bitcoins-online/VE/venezuela/.json"
        let vendorsService = VendorsService(webService: webService, loadURLString: loadUrlString)
        let vendorsDataManager = VendorsDataManager(service: vendorsService)
        return vendorsDataManager
    }()
    
    lazy var countriesDataManager: CountriesDataManagerProtocol =  {
        let loadURLString = "/api/countrycodes/"
        let countryService = CountriesService(webService: webService, loadURLString: loadURLString)
        let countriesDataManager = CountriesDataManager(countryService: countryService)
        return countriesDataManager
    }()
}
