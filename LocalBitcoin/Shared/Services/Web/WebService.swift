//
//  WebService.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation



class WebService: WebServiceProtocol {
    
    func getData(urlService: EndpointString, completion: @escaping (WebServiceTypeDataResult) -> Void) {
//        guard URL(string: "\(urlService.baseURL)\(urlService.endpoint)") != nil else {
//            completion(.failure(.invalidUrl))
//            return
//        }
        
//        let mySelf = "/api/myself/"
//        let contactEndpoint = "/api/account_info/ELEXGARAY/"
//        let recentMessage = "/api/recent_messages/"
//        let endpoint = contactEndpoint
//        
//        let requestT = buildRequest(with: contactEndpoint)
//        URLSession.shared.dataTask(with: requestT) { (data, responer, error) in
//            print(data)
//            let stringData = String(data: data!, encoding: .utf8)
//            print(stringData)
//            print(responer)
//            print(error)
//            }.resume()
        
        
        //        '1551522241766'
        //        '277DD6FD6CF6C54488026AEA97D2D18A532CE0CB9C44170A4A920AAC6944D3B7'
        //        '5e38f8f943ebd582447fb61a3e828bf7'
        let request = URLRequest(url: URL(string:"https://localbitcoins.com\(urlService)")!)
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    guard error == nil else {
                        
                        completion(.failure(.networkError(error!)))
                        return
                    }
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.sucess(data))
                }
                }.resume()
        }
    }
    
    
    private func buildRequest(with endpointString: EndpointString) -> URLRequest {
        
        let baseUrl = "https://localbitcoins.com"
        let nonce = Date().timeIntervalSince1970Millis
        let hmacAuthKey = "5e38f8f943ebd582447fb61a3e828bf7"
        let secret = "ab1482d40ae144ac129d05049757ff6d48171a1159d4d2c4c80155012d3b500b"
        
        let message = "\(nonce)\(hmacAuthKey)\(endpointString)"
        let signature = message.hmac(algorithm: .SHA256, key: secret)
        
        let url = URL(string: "\(baseUrl)\(endpointString)")!
        
        var request = URLRequest(url: url)
        request.setValue(hmacAuthKey, forHTTPHeaderField: "Apiauth-key")
        request.setValue("\(nonce)", forHTTPHeaderField: "Apiauth-Nonce")
        request.setValue(signature, forHTTPHeaderField: "Apiauth-Signature")
        return request
    }
}
