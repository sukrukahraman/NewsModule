//
//  NetworkError.swift
//  NewsAPI
//
//  Created by Sukru Kahraman on 16.11.2021.
//

import Foundation

public enum NetworkError: Error {
    case parseError
    case badUrlError
    case badRequestError
    
    public var messages: String {
        return self.localizedDescription
    }
}
