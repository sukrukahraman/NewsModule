//
//  TableViewExtension.swift
//  Utility
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit

extension UITableViewCell: Reusable {

}

public extension UITableView {

    func register<T: UITableViewCell>(_ cellType: T.Type, reuseIdentifier: String? = nil) {
        if cellType.nibName == "UITableViewCell" {
            self.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier ?? cellType.reuseIdentifier)
        } else {
            self.register(cellType.nib, forCellReuseIdentifier: reuseIdentifier ?? cellType.reuseIdentifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type = T.self) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier) as! T
        return cell
    }

}
