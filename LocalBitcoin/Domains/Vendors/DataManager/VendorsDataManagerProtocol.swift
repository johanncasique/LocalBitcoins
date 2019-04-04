//
//  VendorsDataManagerProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum VendorsDataManagerError: Error {
    case loadError
}

typealias VendorsDataManagerTypeResult = Result<MainDataEntity?, VendorsDataManagerError>

protocol VendorsDataManagerProtocol {
    func loadAds(page: Int, completion: @escaping (VendorsDataManagerTypeResult) -> Void)
}
