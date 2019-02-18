//
//  MainListTableViewDataSource.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class MainListTableViewDataSource: NSObject, UITableViewDataSource {
    private let cellID = "MainCell"
    
    let presenter: MainListPresenterProtocol
    
    init(presenter: MainListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfListItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) else { return UITableViewCell() }
        
        guard let model = presenter.model(at: indexPath) else { return cell }
        cell.textLabel?.text = model.profile.userName
        cell.detailTextLabel?.text = model.tempPrice
        
        return cell
    }
    
}
