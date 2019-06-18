//
//  MainListInteractorProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum MainListInteractorError: Error {
    case loadError
    case loadImageError
    case networkError
}
typealias MainListInteractorTypeResult = Result<MainAdsListResult, MainListInteractorError>

protocol MainListInteractorProtocol {
    func loadAllAds(from country: Country?, for page: Int, completion: @escaping (MainListInteractorTypeResult) -> Void)
}
