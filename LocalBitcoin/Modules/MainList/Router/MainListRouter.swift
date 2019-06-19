//
//  MainListRouter.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 01/05/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit
import SwiftUI

class MainListRouter: MainListRouterProtocol {
    
    weak var baseView: UIViewController?
    
    func goToCountryList() {
        let builder = CountriesBuilder(environment: Environment())
        let countryViewController = builder.build()
        countryViewController.modalPresentationStyle = .fullScreen
        baseView?.present(countryViewController, animated: true)
        (countryViewController as? CountriesViewController)?.presenter.countryDelegate = baseView as? MainListViewController
    }
}
