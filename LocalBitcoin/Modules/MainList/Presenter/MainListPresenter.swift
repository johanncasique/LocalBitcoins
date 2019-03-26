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
    weak var delegate: MainListPresenterDelegate?
    
    fileprivate var adListArray:  [AdList]?
    
    init(interactor: MainListInteractorProtocol) {
        self.interactor = interactor
    }
    
    private func loadAllAds() {
        interactor.loadAllAds { [weak self] result in
            switch result {
            case .sucess(let adsData):
                self?.adListArray = adsData
                self?.delegate?.didRequestListItem()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension MainLisPresenter: MainListPresenterProtocol {
    
    var numberOfListItems: Int {
        guard let modelArray = adListArray else { return 0 }
        return modelArray.count
    }
    
    func viewDidLoad() {
        loadAllAds()
    }
    
    func viewWillBecomeActive() {
        
    }
    
    func viewDidBecomeInactive() {
        
    }
    
    func model(at index: IndexPath) -> MainListViewModel? {
        if let modelArray = adListArray, !modelArray.isEmpty {
            let model = modelArray[index.row].buyData
            let viewModel = MainListViewModel(model)
            return viewModel
        }
        
        return nil
    }
}


