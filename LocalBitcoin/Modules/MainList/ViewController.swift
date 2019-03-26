//
//  ViewController.swift
//  LocalBitcoin
//
//  Created by johann on 24/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    var testData = [AdList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://localbitcoins.com/buy-bitcoins-online/ES/spain/.json?page=1")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, _, error) in
            self.parse(from: data)
        }.resume()
    }

    func parse(from data: Data?) {
        let model = try! JSONDecoder().decode(MainDataEntity.self, from: data!)
        testData = model.data.adList
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if !testData.isEmpty {
            cell.textLabel?.text = testData[indexPath.row].buyData.profile.userName
            cell.detailTextLabel?.text = testData[indexPath.row].buyData.tempPrice
        }
        
        return cell
    }
}
