//
//  DetailViewModelProtocol.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import Foundation

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelDelegate? { get set }
    func load()
}

protocol DetailViewModelDelegate {
    func fillList()
    func update(title: String?)
}
