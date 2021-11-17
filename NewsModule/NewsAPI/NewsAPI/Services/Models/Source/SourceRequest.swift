//
//  SourceRequest.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class SourceRequest: BaseRequest {
    
    public override init() {
        super.init()
        path = "/v2/sources"
        methodType = .get
    }
}
