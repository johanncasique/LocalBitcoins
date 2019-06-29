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
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.registerNibCell(MainListTableViewCell.self)
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
    
    @IBAction func openCountries(_ sender: UIButton) {
        presenter?.openCountryList()
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
            view.addSubview(activity)
        case .bottom:
            let loadingFooterView = UIView()
            loadingFooterView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
            activity.frame = CGRect(x: loadingFooterView.center.x, y: loadingFooterView.center.y, width: 30, height: 30)
            loadingFooterView.addSubview(activity)
            tableView.tableFooterView = loadingFooterView
        }
        activity.style = .gray
        activity.startAnimating()
    }
    
    func hideLoading() {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
}

extension MainListViewController: CountrySelectedDelegate {
    
    func didSelected(country: Country) {
        presenter?.request(country: country)
    }
    
}
