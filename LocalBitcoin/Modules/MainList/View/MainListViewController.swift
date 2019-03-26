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
    let activity = UIActivityIndicatorView()
    
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
    
    func showLoading(at position: LoadingPosition) {
        switch position {
        case .center:
            activity.frame = CGRect(x: view.center.x, y: view.center.y, width: 30, height: 30)
        case .bottom:
            activity.frame = CGRect(x: view.center.x, y: view.center.y, width: 30, height: 30)
        }
        activity.style = .gray
        activity.startAnimating()
        view.addSubview(activity)
    }
    
    func hideLoading() {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
}
