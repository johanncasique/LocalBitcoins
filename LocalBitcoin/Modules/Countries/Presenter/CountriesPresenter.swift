//
//  CountriesPresenter.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class CountriesPresenter {
    
    var router: CountriesRouterProtocol
    var interactor: CountriesInteractorProtocol
    var countriesArray = [Country]()
    weak var delegate: CountriesPresenterDelegate?
    
    init(router: CountriesRouterProtocol, interactor: CountriesInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    private func getCountries() {
        interactor.geCountries { result in
            switch result {
            case .failure(let error): print(error)
            case .sucess(let countries):
                self.countriesArray = countries
                self.delegate?.reloadTableView()
            }
        }
    }
    
    
    
}

extension CountriesPresenter: CountriesPresenterProtocol {
    var numberOfRows: Int {
        return countriesArray.count
    }
    
    func viewDidLoad() {
        getCountries()
    }
    
    func model(from index: IndexPath) -> Country {
        return countriesArray[index.row]
    }
    
    
}
