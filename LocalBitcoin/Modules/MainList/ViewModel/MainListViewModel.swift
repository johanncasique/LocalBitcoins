//
//  MainListViewModel.swift
//  LocalBitcoin
//
//  Created by johann on 04/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

enum OnlineStatus {
    case online
    case recently
    case offline
}

struct MainListViewModel {
    private(set) var profile: Profile
    private(set) var tempPrice: String
    private(set) var minLimits: String
    private(set) var maxLimits: String
    private(set) var paymentMethod: String
    private(set) var bankName: String
}

extension MainListViewModel {
    
    init(_ model: BuyData) {
        self.profile = model.profile
        self.tempPrice = model.tempPrice
        self.minLimits = model.minLimits
        self.maxLimits = model.maxLimits
        self.paymentMethod = model.paymentMethod
        self.bankName = model.bankName
    }
    
    public var getSellerName: String {
        return profile.userName ?? ""
    }
    
    public var getRate: Int {
        switch profile.feedbackScore {
        case 0...20:
            return 1
        case 0...40:
            return 2
        case 0...60:
            return 3
        case 0...80:
            return 4
        case 0...100:
            return 5
        default:
            return 0
        }
    }
    
    public var getPrice: String {
        return tempPrice
    }
    
    public var getLimits: String {
        return "\(minLimits) - \(maxLimits)"
    }
    
    public var getPaymentsMethod: String {
        return "\(paymentMethod): \(bankName)"
    }
    
    public var isOnline: OnlineStatus {
        return .recently
    }
    
}
