//
//  TableViewCellProtocol.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 01/05/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

protocol Reusable { }

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
