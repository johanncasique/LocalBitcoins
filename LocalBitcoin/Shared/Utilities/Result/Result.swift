//
//  File.swift
//  LocalBitcoin
//
//  Created by johann on 29/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum Result<S, E: Error> {
    case sucess(_: S)
    case failure(_: E)
}
