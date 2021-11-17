//
//  UICollectionView+Reusable.swift
//  Utility
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit

extension UICollectionReusableView: Reusable {

}

public extension UICollectionView {

    func register<T: UICollectionViewCell>(_ cellType: T.Type, reuseIdentifier: String? = nil) {
        let identifier = reuseIdentifier ?? cellType.reuseIdentifier
        if cellType.nibName == "UICollectionViewCell" {
            self.register(cellType.classForCoder(), forCellWithReuseIdentifier: identifier)
        } else {
            self.register(cellType.nib, forCellWithReuseIdentifier: identifier)
        }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self, reuseIdentifier: String? = nil) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: reuseIdentifier ?? cellType.reuseIdentifier, for: indexPath) as! T
        return cell
    }

}
