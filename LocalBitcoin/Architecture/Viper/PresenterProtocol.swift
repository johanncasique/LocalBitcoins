//
//  PresenterProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

protocol PresenterProtocol: class {
    func viewWillBecomeActive()
    func viewDidBecomeInactive()
}

extension PresenterProtocol {
    func viewDidBecomeActive() {    }
}
