//
//  AppRouter.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = ListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.tintColor = .blue
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
