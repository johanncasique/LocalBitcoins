//
//  CountriesRouter.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class CountriesRouter: CountriesRouterProtocol {
    
    var countryView: UIViewController?
    
    func goToMainList() {
        countryView?.dismiss(animated: true)
    }
}
