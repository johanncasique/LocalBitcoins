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
    case populated([AdList])
    case paging([AdList], next: Int)
    
    var currentAds: [AdList] {
        switch self {
        case .populated(let adsList):
            return adsList
        case .paging(let pagingAdsList, _):
            return pagingAdsList
        default:
            return []
        }
    }
}

class MainLisPresenter {
    
    let interactor: MainListInteractorProtocol
    let router: MainListRouterProtocol
    weak var delegate: MainListPresenterDelegate?
    var state = State.loading {
        didSet {
            switch state {
            case .loading: showLoadingView()
            case .populated: populateTableView()
            case .paging: populateTableView()
            default: break
            }
        }
    }
    var allAdsArray = [AdList]()
    
    init(interactor: MainListInteractorProtocol, router: MainListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    private func loadAllAds() {
        state = .loading
        request(with: 1)
    }
    
    private func update(_ page: Int) {
        state = .loading
        request(with: page)
    }
    
    
    private func request(with page: Int) {
        interactor.loadAllAds(page: page) { [weak self] result in
            switch result {
            case .sucess(let adsData):
                
                guard let `self` = self else { return }
                var testArray = self.state.currentAds
                testArray.append(contentsOf: adsData.adsArray)
                self.allAdsArray.append(contentsOf: adsData.adsArray)
                
                if adsData.hasMorePages, let nextPage = adsData.nextPage {
                    self.state = .paging(self.allAdsArray, next: nextPage)
                } else {
                    self.state = .populated(self.allAdsArray)
                }
                
            case .failure(let error):
                self?.state = .error(error)
                print(error)
            }
        }
    }
    
    private func populateTableView() {
        delegate?.hideLoading()
        delegate?.didRequestListItem()
    }
    
    func showLoadingView() {
        allAdsArray.isEmpty == true ? delegate?.showLoading(at: .center) : delegate?.showLoading(at: .bottom)
    }
    
}

extension MainLisPresenter: MainListPresenterProtocol {
    
    var numberOfListItems: Int {
        return state.currentAds.count
    }
    
    func viewDidLoad() {
        loadAllAds()
    }
    
    func viewWillBecomeActive() {
        
    }
    
    func viewDidBecomeInactive() {
        
    }
    
    func model(at index: IndexPath) -> MainListViewModel? {
        let model = allAdsArray[index.row].buyData
        let viewModel = MainListViewModel(model)
        return viewModel
    }
    
    func pagination(_ page: Int) {
        update(page)
    }
    
    func openCountryList() {
        router.goToCountryList()
    }
}


