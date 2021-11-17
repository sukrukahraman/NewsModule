//
//  DetailBuilder.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit

final class DetailBuilder {
    
    static func make() -> DetailViewController {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        return viewController
    }
}
