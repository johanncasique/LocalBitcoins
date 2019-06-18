//
//  CountriesProtocol.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

protocol CountriesPresenterProtocol: class {
    var numberOfRows: Int { get }
    var countryDelegate: CountrySelectedDelegate? { get set }
    var countriesArray: [Country] { get set }
    
    func viewDidLoad()
    func model(from index: IndexPath) -> Country
    func country(didSelect at: IndexPath)
    
}

protocol CountriesPresenterDelegate: class {
    func reloadTableView()
}

protocol CountrySelectedDelegate: class {
    func didSelected(country: Country) -> Void
}
