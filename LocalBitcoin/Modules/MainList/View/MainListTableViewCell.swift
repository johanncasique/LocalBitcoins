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
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var minAmountLimitsLabel: UILabel!
    @IBOutlet weak var limitsLabel: UILabel!
    @IBOutlet weak var maxAmountLimitsLabel: UILabel!
    @IBOutlet weak var separatorLimitsView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var iconTypeTransactionImage: UIImageView!
    @IBOutlet weak var typeTransactionLabel: UILabel!
    @IBOutlet weak var buyIconImageView: UIImageView!
    
    override func draw(_ rect: CGRect) {
        firstStackContentView.roundCorners(corners: [.topLeft, .topRight], radius: 5)
        lastStackContentView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 5)
        
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowOpacity = 1
//        shadowView.layer.shadowOffset = .zero
//        shadowView.layer.shadowRadius = 10
    }
    
    func config(with viewModel: MainListViewModel) {
//        sellerLabel.text = viewModel.getSellerName
//        priceLabel.text = viewModel.getPrice
//        limitsLabel.text = viewModel.getLimits
        sellerLabel.text = viewModel.getSellerName
        ratingLabel.text = "(1000 + 99%)"
        ratingImage.image = UIImage(named: "goodRating")
        minAmountLimitsLabel.text = "1,000"
        limitsLabel.text = "Limits"
        maxAmountLimitsLabel.text = "2,000"
        priceLabel.text = viewModel.getPrice
        iconTypeTransactionImage.image = UIImage(named: "transfer")
        typeTransactionLabel.text = "SEPA (EU) bank transfer"
        buyIconImageView.image = UIImage(named: "ic_next")
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
