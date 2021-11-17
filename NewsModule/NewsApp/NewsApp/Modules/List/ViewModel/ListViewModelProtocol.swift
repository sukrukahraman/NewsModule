//
//  ListViewModelProtocol.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation
import NewsAPI

protocol ListViewModelProtocol {
    var delegate: ListViewModelDelegate? { get set }
    func load()
    func selectNews(source: SourceModel)
}

protocol ListViewModelDelegate {
    func fillList()
    func showDetail(source: SourceModel)
    func update(title: String)
}
