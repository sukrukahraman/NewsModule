//
//  APIConstants.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import Foundation

struct APIConfiguration {
    
    public static let shared = APIConfiguration()
    
    public init() {}

    public var baseUrl: String = "https://newsapi.org/"
        
    public var apiKey: String = "75ba701a6ddc4cfa89a452139f2678c9"
        
}
