//
//  ViewController.swift
//  LocalBitcoin
//
//  Created by johann on 24/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

struct MainData: Decodable {
    let data: DataDic
    
    init(data: DataDic) {
        self.data = data
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data: DataDic = try container.decode(DataDic.self, forKey: .data)
        self.init(data: data)
    }
}

struct DataDic: Decodable {
    let adList: [AdList]
    
    init(adList: [AdList]) {
        self.adList = adList
    }
    
    enum CodingKeys: String, CodingKey {
        case adList = "ad_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let adList: [AdList] = try container.decode([AdList].self, forKey: .adList)
        self.init(adList: adList)
    }
}


struct AdList: Decodable {
    let buyData: BuyData
    
    init(buyData: BuyData) {
        self.buyData = buyData
    }
    
    enum CodingKeys: String, CodingKey {
        case buyData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let buyData: BuyData = try container.decode(BuyData.self, forKey: .buyData)
        self.init(buyData: buyData)
    }
    
}

struct BuyData: Decodable {
    var profile: Profile
    var tempPrice: String
    
    init(profile: Profile, tempPrice: String) {
        self.profile = profile
        self.tempPrice = tempPrice
    }
    enum CodingKeys: String, CodingKey {
        case profile = "profile"
        case tempPrice = "temp_price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let profile: Profile = try container.decode(Profile.self, forKey: .profile)
        let price: String = try container.decode(String.self, forKey: .tempPrice)
        self.init(profile: profile, tempPrice: price)
    }
}


struct Profile: Decodable {
    var userName: String?
}



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
        let model = try! JSONDecoder().decode(MainData.self, from: data!)
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
