//
//  CountriesViewController.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }
    
    var presenter: CountriesPresenterProtocol
    
    init(presenter: CountriesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "CountriesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(CountryTableViewCell.self)
        presenter.viewDidLoad()
    }
    
    @IBAction func close(_ sender: UIButton) {
      dismiss(animated: true)
    }

}

extension CountriesViewController: CountriesPresenterDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension CountriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeReusableCell(forIndexPath: indexPath)
        
        cell.configure(from: presenter.model(from: indexPath))
        
        return cell
    }
    
}

extension CountriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.country(didSelect: indexPath)
    }
}
