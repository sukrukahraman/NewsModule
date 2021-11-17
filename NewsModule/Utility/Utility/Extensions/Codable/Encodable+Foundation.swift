//
//  Encodable+Foundation.swift
//  Utility
//
//  Created by Sukru Kahraman on 15.11.2021.
//

import Foundation

public extension Encodable {

    func toDictionary() -> [String: Any] {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
    }

}
