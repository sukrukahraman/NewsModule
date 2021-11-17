//
//  NetworkRouter.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import Foundation
import Alamofire
import Utility

public class NetworkRouter: URLRequestConvertible, NetworkProtocol {
    public var parameters: BaseRequestModel?
    
    var path: String = ""
    
    public var methodType: HTTPMethod = .get
        
    // MARK: - URLRequestConvertible
    public func asURLRequest() throws -> URLRequest {
        var urlComponent = URLComponents(string: APIConfiguration.shared.baseUrl)!
        urlComponent.path = path
        if methodType == .get {
            if let parameter = parameters {
                urlComponent.queryItems = parameter.toDictionary().map { (key, value) in
                    URLQueryItem(name: key, value: "\(value)")
                }
            }
        }

        var urlRequest = URLRequest(url: urlComponent.url!)

        // HTTP Method
        urlRequest.httpMethod = methodType.rawValue

        // Parameters
        if methodType != .get {
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters.toDictionary(), options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }

        return urlRequest
    }
}
