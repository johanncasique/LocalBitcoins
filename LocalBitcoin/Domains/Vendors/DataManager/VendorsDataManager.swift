//
//  VendorsDataManager.swift
//  LocalBitcoin
//
//  Created by johann on 01/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class VendorsDataManager: VendorsDataManagerProtocol {
    
    let service: VendorsServiceProtocol
    
    init(service: VendorsServiceProtocol) {
        self.service = service
    }
    
    func loadAds(from country: Country?, for page: Int, completion: @escaping (VendorsDataManagerTypeResult) -> Void) {
        service.loadData(with: country, for: page) { result in
            switch result {
                
            case .sucess(let resultData):
                guard let data = resultData else {
                    completion(.failure(.loadError))
                    return
                }
                completion(.sucess(data))
            case .failure(_):
                completion(.failure(.loadError))
            }
        }
    }    
}
