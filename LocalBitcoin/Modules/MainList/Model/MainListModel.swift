//
//  MainListModel.swift
//  LocalBitcoin
//
//  Created by johann on 04/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

struct MainDataEntity: Decodable {
    let data: DataDic
    let pagination: Pagination
}

struct DataDic: Decodable {
    let adList: [AdList]
    
    init(adList: [AdList]) {
        self.adList = adList
    }
    
    enum CodingKeys: String, CodingKey {
        case adList = "ad_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let adList: [AdList] = try container.decode([AdList].self, forKey: .adList)
        self.init(adList: adList)
    }
}

struct AdList: Decodable {
    let buyData: BuyData
    
    init(buyData: BuyData) {
        self.buyData = buyData
    }
    
    enum CodingKeys: String, CodingKey {
        case buyData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let buyData: BuyData = try container.decode(BuyData.self, forKey: .buyData)
        self.init(buyData: buyData)
    }
    
}

struct Pagination: Decodable {
    let prev: String?
    let next: String?
}

struct BuyData: Decodable {
    var profile: Profile
    var tempPrice: String
    var minLimits: String
    var maxLimits: String
    var paymentMethod: String
    var bankName: String
    
    init(profile: Profile, tempPrice: String, minLimits: String, maxLimits: String, paymentMethod: String, bankName: String) {
        self.profile = profile
        self.tempPrice = tempPrice
        self.minLimits = minLimits
        self.maxLimits = maxLimits
        self.paymentMethod = paymentMethod
        self.bankName = bankName
    }
    enum CodingKeys: String, CodingKey {
        case profile = "profile"
        case tempPrice = "temp_price"
        case minLimits = "min_amount"
        case maxLimits = "max_amount"
        case paymentMethod = "online_provider"
        case bankName = "bank_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let profile: Profile = try container.decodeIfPresent(Profile.self, forKey: .profile) ?? Profile(userName: "", feedbackScore: 0, tradeCount: "", lastOnline: "")
        let price: String = try container.decodeIfPresent(String.self, forKey: .tempPrice) ?? ""
        let minLimits: String = try container.decodeIfPresent(String.self, forKey: .minLimits) ?? ""
        let maxLimits: String = try container.decodeIfPresent(String.self, forKey: .maxLimits) ?? ""
        let paymentMethod: String = try container.decodeIfPresent(String.self, forKey: .paymentMethod) ?? ""
        let bankName: String = try container.decodeIfPresent(String.self, forKey: .bankName) ?? ""
        self.init(profile: profile, tempPrice: price, minLimits: minLimits, maxLimits: maxLimits, paymentMethod: paymentMethod, bankName: bankName)
    }
}

struct Profile: Decodable {
    var userName: String?
    var feedbackScore: Int
    var tradeCount: String
    var lastOnline: String
    
    init(userName: String, feedbackScore: Int, tradeCount: String, lastOnline: String) {
        self.userName = userName
        self.feedbackScore = feedbackScore
        self.tradeCount = tradeCount
        self.lastOnline = lastOnline
    }
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
        case feedbackScore = "feedback_score"
        case tradeCount = "trade_count"
        case lastOnline = "last_online"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let userName: String = try container.decode(String.self, forKey: .userName)
        let feedbackScore: Int = try container.decode(Int.self, forKey: .feedbackScore)
        let tradeCount: String = try container.decode(String.self, forKey: .tradeCount)
        let lastOnline: String = try container.decode(String.self, forKey: .lastOnline)
        self.init(userName: userName, feedbackScore: feedbackScore, tradeCount: tradeCount, lastOnline: lastOnline)
    }
}
