//
//  SourceModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class SourceModel: BaseModel {
    public var id: String?
    public var name: String?
    public var sourceDescription: String?
    public var url: String?
    public var category: String?
    public var language: String?
    public var country: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case sourceDescription = "description"
        case url
        case category
        case language
        case country
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        sourceDescription = try container.decodeIfPresent(String.self, forKey: .sourceDescription)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        category = try container.decodeIfPresent(String.self, forKey: .category)
        language = try container.decodeIfPresent(String.self, forKey: .language)
        country = try container.decodeIfPresent(String.self, forKey: .country)
        
        try super.init(from: decoder)
        
    }

}
