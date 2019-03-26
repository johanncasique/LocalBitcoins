//
//  MainListPresenterProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum LoadingPosition {
    case center
    case bottom
}

protocol MainListPresenterDelegate: class {
    func didRequestListItem()
    func showLoading(at position: LoadingPosition)
    func hideLoading()
}

protocol MainListPresenterProtocol: PresenterProtocol {
    var numberOfListItems: Int { get }
    
    func viewDidLoad()
    func model(at index: IndexPath) -> MainListViewModel?
    
}
