//
//  BaseRequestModel.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import Foundation

public class BaseRequestModel: Encodable {
    
    public let apiKey: String = APIConfiguration.shared.apiKey
    
    public init() {}
    
}

