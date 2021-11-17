//
//  HeadlineRequest.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public class HeadlineRequest: BaseRequest {
    
    public override init() {
        super.init()
        path = "/v2/top-headlines"
        methodType = .get
        showLoading = true
    }
}
