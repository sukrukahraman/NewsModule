//
//  NetworkRequest.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Alamofire
import Utility

public final class NetworkRequest {
    public static let shared = NetworkRequest()
    
    public func execute<M: Codable>(requestRoute: BaseRequest,
                                    responseModel: M.Type,
                                    completion: @escaping (Swift.Result<M, NetworkError>) -> Void) {
        do {
            let urlRequest = try requestRoute.asURLRequest() //router için oluşturulmuş URLRequest
            Alamofire.request(urlRequest).validate().responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let jsonResults = try JSONDecoder().decode(responseModel, from: jsonData)
                            completion(.success(jsonResults))
                    } catch {
                            completion(.failure(.parseError))
                    }
                    break
                case .failure:
                        completion(.failure(.badRequestError))
                }
            }
        } catch {
                completion(.failure(.badUrlError))
        }
    }
}
