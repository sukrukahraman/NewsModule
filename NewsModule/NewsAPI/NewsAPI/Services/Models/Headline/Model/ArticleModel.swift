//
//  ArticleModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class ArticleModel: BaseModel {
    public var source: SourceModel?
    public var author: String?
    public var title: String?
    public var articleDescription: String?
    public var url: String?
    public var urlToImage: String?
    public var publishedAt: String?
    public var content: String?
    
    private enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case articleDescription = "description"
        case url
        case urlToImage
        case publishedAt
        case content
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decodeIfPresent(SourceModel.self, forKey: .source)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        articleDescription = try container.decodeIfPresent(String.self, forKey: .articleDescription)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try container.decodeIfPresent(String.self, forKey: .content)
        
        try super.init(from: decoder)
        
    }

}
