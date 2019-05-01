//
//  CountriesBuilder.swift
//  LocalBitcoin
//
//  Created by Johann Casique on 06/04/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class CountriesBuilder: EnvironmentConsumer, BuilderProtocol {    
    
    func build() -> UIViewController {
        
        let interactor = CountriesInteractor(dataManager: environment.countriesDataManager)
        let router = CountriesRouter()
        let presenter = CountriesPresenter(router: router, interactor: interactor)
        let view = CountriesViewController(presenter: presenter)
        view.presenter = presenter
        presenter.delegate = view
        router.countryView = view
        
        return view
    }
}
