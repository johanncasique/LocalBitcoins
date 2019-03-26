//
//  MainListPresenter.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum State {
    case loading
    case error(Error)
    case empty
    case populated
}

class MainLisPresenter {
    
    let interactor: MainListInteractorProtocol
    weak var delegate: MainListPresenterDelegate?
    var state = State.loading
    
    fileprivate var adListArray: [AdList]?
    
    init(interactor: MainListInteractorProtocol) {
        self.interactor = interactor
    }
    
    private func loadAllAds() {
        view(.loading)
        interactor.loadAllAds { [weak self] result in
            switch result {
            case .sucess(let adsData):
                self?.adListArray = adsData
                self?.delegate?.didRequestListItem()
                self?.view(.populated)
            case .failure(let error):
                self?.view(.error(error))
                print(error)
            }
            
        }
    }
    
    func view(_ state: State) {
        switch state {
        case .loading:
            adListArray?.isEmpty == true ? delegate?.showLoading(at: .center) : delegate?.showLoading(at: .bottom)
        case .populated:
            delegate?.hideLoading()
        default:
            break
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


