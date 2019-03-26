//
//  MainListBuilder.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class MainListBuilder: EnvironmentConsumer, BuilderProtocol {
    func build() -> UIViewController {
        
        let interactor = MainListInteractor(dataManager: environment.vendorsDataManager)
        let presenter = MainLisPresenter(interactor: interactor)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dataSource = MainListTableViewDataSource(presenter: presenter)
        let view = storyboard.instantiateInitialViewController() as! MainListViewController
        view.presenter = presenter
        view.dataSource = dataSource
        presenter.delegate = view
        
        return view
    }
}
