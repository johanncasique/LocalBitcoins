//
//  VendorsService.swift
//  LocalBitcoin
//
//  Created by johann on 01/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class VendorsService: VendorsServiceProtocol {
    let webService: WebServiceProtocol
    let loadURLString: String
    
    init(webService: WebServiceProtocol, loadURLString: String) {
        self.webService = webService
        self.loadURLString = loadURLString
    }
    
    func loadMain(completion: @escaping (VendorsServiceResult) -> Void) {
        
        webService.getData(urlString: loadURLString) { result in
            switch result {
            case .failure(let error):
                switch error {
                case .invalidUrl:
                    completion(.failure(.invalidURL))
                case .jsonParseError:
                    completion(.failure(.invalidVendorData))
                case .networkError(let error):
                    completion(.failure(.networkError(error)))
                case .noData:
                    completion(.failure(.noBitcoinData))
                }
            case .sucess(let json):
                
                
                do {
                    let mainData = try JSONDecoder().decode(MainDataEntity.self, from: json)
                    completion(.sucess(mainData))
                } catch let error {
                    print(error)
                    completion(.failure(.invalidVendorData))
                }
            }
        }
    }
}
