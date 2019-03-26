//
//  MainListTableViewCell.swift
//  LocalBitcoin
//
//  Created by johann on 26/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class MainListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var limitsLabel: UILabel!
    
    func config(with viewModel: MainListViewModel) {
        sellerLabel.text = viewModel.getSellerName
        paymentMethodLabel.text = viewModel.getPaymentsMethod
        priceLabel.text = viewModel.getPrice
        limitsLabel.text = viewModel.getLimits
    }
    
}
