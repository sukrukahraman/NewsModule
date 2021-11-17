//
//  DetailBuilder.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit
import NewsAPI

final class DetailBuilder {
    
    static func make(source: SourceModel) -> DetailViewController {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let viewModel = DetailViewModel()
        viewModel.source = source
        viewController.viewModel = viewModel
        return viewController
    }
}
