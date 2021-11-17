//
//  NetworkProtocol.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    
    var path: String { get set}
    
    var methodType: HTTPMethod { get set}
    
    var parameters: BaseRequestModel? { get set}
    
}
