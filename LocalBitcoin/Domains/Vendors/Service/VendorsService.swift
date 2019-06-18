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
    
    func loadData(with country: Country?, for page: Int, completion: @escaping (VendorsServiceResult) -> Void) {
        
        let urlString = "\(loadURLString)\(buildCountryPath(from: country)).json?page=\(page)"
        
        getData(from: urlString) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .sucess(let success): completion(.sucess(success))
            }
        }
    }
    
    private func getData(from urlString: String, completion: @escaping (VendorsServiceResult) -> Void) {
        
        webService.getData(urlService: urlString) { result in
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
    
    private func buildCountryPath(from countryISO: Country?) -> String {
        
        if let iso = countryISO, var countryName = Locale.countryName(from: iso.isoCode) {
            let isoCode = iso.isoCode
            countryName = countryName.removeWhiteSpaces
            return "\(isoCode)/\(countryName)/"
        } else {
            let defaultCountryISO = Locale.countryISO ?? "VE"
            let countryName = Locale.countryName(from: defaultCountryISO)?.removeWhiteSpaces ?? "venezuela"
            
            return "\(defaultCountryISO)/\(countryName)/"
        }
    }
}
