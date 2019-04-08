//
//  CountryTableViewCell.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 08/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit
import FlagKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    func configure(from model: Country) {
        let bundle = FlagKit.assetBundle
        countryFlagImageView.image = UIImage(named: model.isoCode, in: bundle, compatibleWith: nil)
        countryName.text = model.isoCode
    }
}
