//
//  SourceResponseModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class SourceResponseModel: BaseResponseModel {
    
    public var sources: [SourceModel]?
    
    private enum CodingKeys: String, CodingKey {
        case sources
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sources = try container.decodeIfPresent([SourceModel].self, forKey: .sources)
        
        try super.init(from: decoder)
        
    }
    
}
