//
//  FilterModel.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import Foundation

public class FilterModel {
    var name: String
    var selected: Bool
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
}
