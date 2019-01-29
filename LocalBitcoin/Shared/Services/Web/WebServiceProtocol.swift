//
//  WebServiceProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum WebServiceError: Error {
    case invalidUrl
    case noData
    case networkError(Error)
    case jsonParseError
}

typealias WebServiceTypeDataResult = Result<Data, WebServiceError>

protocol WebServiceProtocol {
    func getData(urlString: String, completion: @escaping (WebServiceTypeDataResult) -> Void)
}
