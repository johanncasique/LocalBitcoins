//
//  MainListTableViewCell.swift
//  LocalBitcoin
//
//  Created by johann on 26/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class MainListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var firstStackContentView: UIView!
    @IBOutlet weak var lastStackContentView: UIView!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var onlineStatus: UIView!
    @IBOutlet weak var minAmountLimitsLabel: UILabel!
    @IBOutlet weak var limitsLabel: UILabel!
    @IBOutlet weak var maxAmountLimitsLabel: UILabel!
    @IBOutlet weak var separatorLimitsView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var iconTypeTransactionImage: UIImageView!
    @IBOutlet weak var typeTransactionLabel: UILabel!
    @IBOutlet weak var buyIconImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    override func draw(_ rect: CGRect) {
        firstStackContentView.roundCorners(corners: [.topLeft, .topRight], radius: 5)
        lastStackContentView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 5)
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 3
        shadowView.layer.cornerRadius = 5
    }
    
    func config(with viewModel: MainListViewModel) {
        
        sellerLabel.text = viewModel.getSellerName
        ratingLabel.text = "(\(viewModel.profile.tradeCount))"
        onlineStatus.backgroundColor = .green
        onlineStatus.layer.cornerRadius = onlineStatus.frame.width / 2
        minAmountLimitsLabel.text = "1,000"
        limitsLabel.text = "Limits"
        maxAmountLimitsLabel.text = "2,000"
        priceLabel.text = viewModel.getPrice
        iconTypeTransactionImage.image = UIImage(named: "transfer")
        typeTransactionLabel.text = "SEPA (EU) bank transfer"
        buyIconImageView.image = UIImage(named: "ic_next")
        if ratingStackView.arrangedSubviews.isEmpty {
            configRatingStackView(with: viewModel.getRate)
        }
    }
    
    private func configRatingStackView(with value: Int) {
        
        for index in 0...4 {
            let starImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
            starImageView.image = getRateImage(from: index, rateValue: value)
            let starView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
            starView.addSubview(starImageView)
            ratingStackView.insertArrangedSubview(starView, at: index)
        }
    }
    
    private func getRateImage(from index: Int, rateValue: Int) -> UIImage? {
        if index < rateValue {
            return UIImage(named: "ic_star")
        } else {
            return UIImage(named: "ic_EmptyStar")
        }
    }
}
