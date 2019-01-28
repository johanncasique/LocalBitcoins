//
//  MainListViewController.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation
import UIKit

class MainListViewController<P: MainListPresenterProtocol>: ViperViewController<P> {
    
    let tableViewDataSource: UITableViewDataSource
    let tableViewDelegate: UITableViewDelegate
    
    init(presenter: P, dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        self.tableViewDataSource = dataSource
        self.tableViewDelegate = delegate
        super.init(presenter: presenter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
