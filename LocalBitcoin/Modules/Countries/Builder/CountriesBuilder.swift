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
        
        return view
        
//        let interactor = MainListInteractor(dataManager: environment.vendorsDataManager)
//        let presenter = MainLisPresenter(interactor: interactor)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let dataSource = MainListTableViewDataSource(presenter: presenter)
//        let view = storyboard.instantiateInitialViewController() as! MainListViewController
//        view.presenter = presenter
//        view.dataSource = dataSource
//        presenter.delegate = view
//
//        return view
    }
}
