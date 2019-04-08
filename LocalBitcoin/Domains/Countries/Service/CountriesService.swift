//
//  CountriesService.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class CountriesService: CountriesServiceProtocol {
    
    let webService: WebServiceProtocol
    let loadURLString: String
    
    init(webService: WebServiceProtocol, loadURLString: String) {
        self.webService = webService
        self.loadURLString = loadURLString
    }
    
    func getCountries(completion: @escaping (CountriesServiceResult) -> Void) {
        
        webService.getData(urlService: loadURLString) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                
                completion(.failure(self.errorParse(from: error)))
                
            case .sucess(let jsonData):
                
                switch self.parse(from: jsonData) {
                    
                case .sucess(let countries): completion(.sucess(countries))
                case .failure(let error): completion(.failure(error))
                }
            }
        }
        
    }
    
    private func errorParse(from result: WebServiceError) -> CountriesServiceError {
        switch result {
        case .invalidUrl:               return .invalidURL
        case .jsonParseError:           return .invalidData
        case .networkError(let error):  return .networkError(error)
        case .noData:                   return .noCountryData
        }
    }
    
    private func parse(from data: Data) -> CountriesServiceResult {
        do {
            print(String(data: data, encoding: .utf8))
            let countries = try JSONDecoder().decode(Countries.self, from: data)
            return .sucess(countries)
        } catch {
            return .failure(.invalidData)
        }
    }
}
