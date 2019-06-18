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
        if #available(iOS 13, *) {
            print("iOS 13")
            baseView?.present(UIHostingController(rootView: CountriesView()), animated: true) 
        } else {
            let builder = CountriesBuilder(environment: Environment())
            let countryViewController = builder.build()
            baseView?.present(countryViewController, animated: true)
            (countryViewController as? CountriesViewController)?.presenter.countryDelegate = baseView as? MainListViewController
        }
       
    }
}
