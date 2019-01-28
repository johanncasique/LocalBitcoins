//
//  ViewProtocol.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

protocol ViewProtocol {
    associatedtype P: PresenterProtocol
    var presenter: P { get }
}
