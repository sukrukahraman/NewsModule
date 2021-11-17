//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import Foundation
import NewsAPI

public enum DetailFeed {
    case gallery(articles: [ArticleModel])
    case article(articles: [ArticleModel])
}

final class DetailViewModel: DetailViewModelProtocol {
    var delegate: DetailViewModelDelegate?
    
    var feeds: [DetailFeed] = []
    var source: SourceModel!
    
    init() {}
    
    func updateTitle(title: String?) {
        delegate?.update(title: title)
    }
    
    func load() {
        let request = HeadlineRequest()
        let requestModel = HeadlineRequestModel()
        requestModel.sources = source.id
        request.parameters = requestModel
        NewsService.send(request: request, response: HeadlineResponseModel.self) { [weak self] (response, error) in
            guard let self = self else { return}
            guard let articles = response?.articles else {  return }
            self.arrange(articles: articles)
            
        }
    }
    
    private func arrange(articles: [ArticleModel]) {
        var galleryArticles: [ArticleModel] = []
        var newsArticles: [ArticleModel] = []
        for index in 0..<articles.count {
            if index > 2 {
                newsArticles.append(articles[index])
            } else {
                galleryArticles.append(articles[index])
            }
        }
        
        self.arrangeFeed(gallery: galleryArticles, articles: newsArticles)
    }
    
    private func arrangeFeed(gallery: [ArticleModel], articles: [ArticleModel]) {
        feeds = [.gallery(articles: gallery), .article(articles: articles)]
        delegate?.fillList()
    }
    
    func selectNews(index: Int) {
        
    }

}
