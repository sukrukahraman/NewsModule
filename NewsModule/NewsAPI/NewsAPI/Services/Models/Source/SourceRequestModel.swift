//
//  SourceRequestModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class SourceRequestModel: BaseRequestModel {

    public var language: String = "en"
    
    public enum CodingKeys: String, CodingKey {
        case language
    }
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(language, forKey: .language)
        try super.encode(to: encoder)
    }

    
    
}
