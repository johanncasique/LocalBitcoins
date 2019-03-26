//
//  EnvironmentConsumer.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

class EnvironmentConsumer {
    let environment: EnvironmentProtocol
    
    init(environment: EnvironmentProtocol) {
        self.environment = environment
    }
}
