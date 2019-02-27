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
        let profile: Profile = try container.decode(Profile.self, forKey: .profile)
        let price: String = try container.decode(String.self, forKey: .tempPrice)
        let minLimits: String = try container.decode(String.self, forKey: .minLimits)
        let maxLimits: String = try container.decode(String.self, forKey: .maxLimits)
        let paymentMethod: String = try container.decode(String.self, forKey: .paymentMethod)
        let bankName: String = try container.decode(String.self, forKey: .bankName)
        self.init(profile: profile, tempPrice: price, minLimits: minLimits, maxLimits: maxLimits, paymentMethod: paymentMethod, bankName: bankName)
    }
}

struct Profile: Decodable {
    var userName: String?
    
    init(userName: String) {
        self.userName = userName
    }
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let userName: String = try container.decode(String.self, forKey: .userName)
        self.init(userName: userName)
    }
}
