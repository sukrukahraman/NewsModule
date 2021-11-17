//
//  HeadlineRequestModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class HeadlineRequestModel: BaseRequestModel {

    public var sources: String?
    
    public enum CodingKeys: String, CodingKey {
        case sources
    }
    
    public override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sources, forKey: .sources)
        try super.encode(to: encoder)
    }
    
}
