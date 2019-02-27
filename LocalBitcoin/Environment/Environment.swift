//
//  Environment.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class Environment: EnvironmentProtocol {
    
    let loadUrlString = "https://localbitcoins.com/buy-bitcoins-online/VE/venezuela/.json?page=1"
    let webService = WebService()
    
    lazy var vendorsDataManager: VendorsDataManagerProtocol = {
        let vendorsService = VendorsService(webService: webService, loadURLString: loadUrlString)
        let vendorsDataManager = VendorsDataManager(service: vendorsService)
        return vendorsDataManager
    }()
    
}
