//
//  VendorsServiceProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 01/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum VendorsServiceError: Error {
    case invalidURL
    case noBitcoinData
    case invalidVendorData
    case networkError(Error)
}

typealias VendorsServiceResult = Result<MainDataEntity?, VendorsServiceError>

protocol VendorsServiceProtocol {
    func loadMain(completion: @escaping (VendorsServiceResult) -> Void)
}
