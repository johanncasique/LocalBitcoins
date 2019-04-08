//
//  Countries.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

struct CountryData: Codable {
    let data: Countries
}

struct Countries: Codable {
    let countryList: [Country]
    let countryCount: Int
    
    init(countryList: [Country], countryCount: Int) {
        self.countryList = countryList
        self.countryCount = countryCount
    }
    
    enum CodingKeys: String, CodingKey {
        case countryList = "cc_list"
        case countryCount = "cc_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let countryList: [Country] = try container.decode([Country].self, forKey: .countryList)
        let countryCount: Int = try container.decode(Int.self, forKey: .countryCount)
        self.init(countryList: countryList, countryCount: countryCount)
    }
}

struct Country: Codable {
    let isoCode: String
}


