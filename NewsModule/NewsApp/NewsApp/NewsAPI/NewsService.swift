//
//  NewsService.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation
import NewsAPI

public struct NewsService {
    
    public static func send<M: Codable>(request: BaseRequest, response: M.Type, completion: @escaping ((M?, NetworkError?) -> Void)) {
        NetworkRequest.shared.execute(requestRoute: request, responseModel: response.self) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
