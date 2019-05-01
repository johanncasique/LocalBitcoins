//
//  LocaleExtension.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 01/05/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation

extension Locale {
    static var countryISO: String? {
        return current.regionCode
    }
    
    static func countryName(from regionCode: String) -> String? {
        return current.localizedString(forRegionCode: regionCode)
    }
}
