//
//  VendorsDataManager.swift
//  LocalBitcoin
//
//  Created by johann on 01/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class VendorsDataManager: VendorsDataManagerProtocol {
    
    //TODO: create service init
    let service: VendorsServiceProtocol
    
    init(service: VendorsServiceProtocol) {
        self.service = service
    }
    
    func loadAds(page: Int, completion: @escaping (VendorsDataManagerTypeResult) -> Void) {
        service.loadMain(page: page) { result in
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
