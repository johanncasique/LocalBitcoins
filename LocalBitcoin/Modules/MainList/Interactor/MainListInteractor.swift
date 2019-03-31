//
//  MainListInteractor.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

struct MainAdsListResult {
    let ads: [AdList]?
    let previousPaginatin: String?
    let nextPagination: String?
    
    var adsArray: [AdList] {
        return self.ads ?? []
    }
    
    var hasMorePages: Bool {
        return nextPage != nil
    }
    
    var nextPage: Int? {
        guard let pagination = nextPagination?.last else { return nil }
        return Int("\(pagination)")
    }
}

class MainListInteractor: MainListInteractorProtocol {
    
    let dataManager: VendorsDataManagerProtocol
    
    init(dataManager: VendorsDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func loadAllAds(page: Int, completion: @escaping (MainListInteractorTypeResult) -> Void) {
        
        dataManager.loadAds(page: page) { (result) in
            switch result {
            case .sucess(let resultData):
                let result = MainAdsListResult(ads: resultData?.data.adList,
                                               previousPaginatin: resultData?.pagination.prev,
                                               nextPagination: resultData?.pagination.next)
                
                completion(.sucess(result))
                print(resultData ?? "")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
