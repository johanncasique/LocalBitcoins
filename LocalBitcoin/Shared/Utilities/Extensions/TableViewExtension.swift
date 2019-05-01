//
//  TableViewExtension.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 01/05/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }
    
    func registerNibCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(UINib(nibName: cellClass.reuseID, bundle: nil), forCellReuseIdentifier: cellClass.reuseID)
    }
    
    func dequeReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError()
        }
        
        return cell
    }
}
