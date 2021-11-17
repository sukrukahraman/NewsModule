//
//  ListBuilder.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit

final class ListBuilder {
    
    static func make() -> ListViewController {
        let storyboard = UIStoryboard(name: "ListView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        return viewController
    }
}
