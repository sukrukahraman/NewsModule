//
//  HeadlineResponseModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class HeadlineResponseModel: BaseResponseModel {
    
    public var totalResults: Int?
    public var articles: [ArticleModel]?
    
    private enum CodingKeys: String, CodingKey {
        case totalResults
        case articles
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try container.decodeIfPresent([ArticleModel].self, forKey: .articles)
        
        try super.init(from: decoder)
        
    }
    
}
