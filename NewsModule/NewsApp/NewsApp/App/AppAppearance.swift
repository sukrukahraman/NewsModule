//
//  AppAppearance.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit

final class AppAppearance {
    
    init() {}
    
    func setNavgiationAppearance() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .blue
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance;
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
            UINavigationBar.appearance().backgroundColor = UIColor.blue
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

        }
    }
}
