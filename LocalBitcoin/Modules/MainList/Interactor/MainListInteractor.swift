//
//  MainListInteractor.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class MainListInteractor: MainListInteractorProtocol {
    
    let dataManager: VendorsDataManagerProtocol
    
    init(dataManager: VendorsDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func loadAllAds(completion: @escaping (MainListInteractorTypeResult) -> Void) {
        
        dataManager.loadAds { (result) in
            switch result {
            case .sucess(let resultData):
                print(resultData ?? "")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
