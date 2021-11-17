//
//  StringExtension.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
