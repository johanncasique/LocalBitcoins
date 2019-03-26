//
//  DateExtension.swift
//  LocalBitcoin
//
//  Created by Casique, Johan on 11/03/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

extension Date {
    var timeIntervalSince1970Millis: Int {
        return Int(timeIntervalSince1970 * 1000)
    }
}
