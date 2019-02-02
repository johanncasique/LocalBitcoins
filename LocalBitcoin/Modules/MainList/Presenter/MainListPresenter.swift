//
//  MainListPresenter.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class MainLisPresenter {
    
    let interactor: MainListInteractorProtocol
    
    init(interactor: MainListInteractorProtocol) {
        self.interactor = interactor
    }
    
}

extension MainLisPresenter: MainListPresenterProtocol {
    var numberOfListItems: Int {
        return 0
    }
    
    func viewDidLoad() {
        interactor.loadAllAds { result in
            print(result)
        }
    }
    
    func viewWillBecomeActive() {
        
    }
    
    func viewDidBecomeInactive() {
        
    }
}
