//
//  MainListInterfaceBuilder.swift
//  LocalBitcoin
//
//  Created by johann on 02/02/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class MainUserInterfaceBuilder: EnvironmentConsumer, BuilderProtocol {
    lazy var currentWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = build()
        window.makeKeyAndVisible()
        return window
    }()
    
    func build() -> UIViewController {
        let builder = MainListBuilder(environment: environment)
        let viewController = builder.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        return  navigationController
    }
    
}
