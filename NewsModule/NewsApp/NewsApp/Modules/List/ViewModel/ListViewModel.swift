//
//  ListViewModel.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation
import NewsAPI

public enum ListFeed {
    case categories(filters: [FilterModel])
    case news(sources: [SourceModel])
}

final class ListViewModel: ListViewModelProtocol {
    var delegate: ListViewModelDelegate?
    
    var feeds: [ListFeed] = []
    var filterModels: [FilterModel] = []
    
    init() {}
    
    func updateTitle(title: String) {
        delegate?.update(title: title)
    }
    
    func load() {
        let request = SourceRequest()
        let requestModel = SourceRequestModel()
        request.parameters = requestModel
        NewsService.send(request: request, response: SourceResponseModel.self) { [weak self] (response, error) in
            guard let self = self else { return}
            guard let sources = response?.sources else {  return }
            self.arrangeFilters(sources: sources)
        }
    }
    
    private func arrangeFilters(sources: [SourceModel]) {
        var filters: [String] = []
        for source in sources {
            if let category = source.category {
                if !filters.contains(category) {
                    filters.append(category)
                }
            }
        }
        for filter in filters {
            filterModels.append(FilterModel(name: filter, selected: false))
        }
        
        self.arrangeFeed(filters: filterModels, sources: sources)
    }
    
    private func arrangeFeed(filters: [FilterModel], sources: [SourceModel]) {
        feeds = [.categories(filters: filters), .news(sources: sources)]
        delegate?.fillList()
    }
    
    func selectNews(source: SourceModel) {
        delegate?.showDetail(source: source)
    }

}
