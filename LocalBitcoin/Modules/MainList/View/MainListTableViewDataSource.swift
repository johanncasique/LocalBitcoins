//
//  MainListTableViewDataSource.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class MainListTableViewDataSource: NSObject, UITableViewDataSource {
    let presenter: MainListPresenterProtocol
    
    init(presenter: MainListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfListItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MainListTableViewCell = tableView.dequeReusableCell(forIndexPath: indexPath)
        
        guard let model = presenter.model(at: indexPath) else { return cell }
        cell.config(with: model)
        
        if case .paging(_, let nextPage) = presenter.state,
            indexPath.row == presenter.state.currentAds.count - 1 {
                self.presenter.pagination(nextPage)
        }
    
        return cell
    }
    
}
