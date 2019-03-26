//
//  ViperViewController.swift
//  LocalBitcoin
//
//  Created by johann on 28/01/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class ViperViewController<P: PresenterProtocol>: UIViewController, ViewProtocol {
    
    let presenter: P
    
    init(presenter: P) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillBecomeActive()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter.viewDidBecomeInactive()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
