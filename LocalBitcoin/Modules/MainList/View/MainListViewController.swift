//
//  MainListViewController.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import Foundation
import UIKit

class MainListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainListPresenterProtocol?
    var dataSource: MainListTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: "MainListTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        presenter?.viewDidLoad()
    }
    
}

extension MainListViewController: MainListPresenterDelegate {
    func didRequestListItem() {
        tableView.reloadData()
    }
}
