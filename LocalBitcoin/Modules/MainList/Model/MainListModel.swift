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
    
    init(profile: Profile, tempPrice: String) {
        self.profile = profile
        self.tempPrice = tempPrice
    }
    enum CodingKeys: String, CodingKey {
        case profile = "profile"
        case tempPrice = "temp_price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let profile: Profile = try container.decode(Profile.self, forKey: .profile)
        let price: String = try container.decode(String.self, forKey: .tempPrice)
        self.init(profile: profile, tempPrice: price)
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
