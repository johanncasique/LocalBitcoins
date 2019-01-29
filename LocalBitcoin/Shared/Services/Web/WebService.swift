//
//  WebService.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class WebService: WebServiceProtocol {
    
    func getData(urlString: String, completion: @escaping (WebServiceTypeDataResult) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.networkError(error!)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.sucess(data))
            }.resume()
    }
}
