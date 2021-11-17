//
//  Reusable.swift
//  Utility
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import UIKit

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

public protocol NibProviable {
    static var nibName: String { get }
    static var nib: UINib { get }
}

public extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension NibProviable {
    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
}

public typealias Reusable = ReusableView & NibProviable

