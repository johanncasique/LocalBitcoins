//
//  CountriesProtocol.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

protocol CountriesPresenterProtocol {
    var numberOfRows: Int { get }
    
    func viewDidLoad()
    func model(from index: IndexPath) -> Country
    
}

protocol CountriesPresenterDelegate: class {
    func reloadTableView()
}


