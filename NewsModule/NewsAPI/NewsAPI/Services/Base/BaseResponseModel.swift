//
//  BaseResponseModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import Foundation

public class BaseResponseModel: BaseModel {
    
    public var status: String?

    private enum CodingKeys: String, CodingKey {
        case status
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        
        try super.init(from: decoder)
        
    }

}
