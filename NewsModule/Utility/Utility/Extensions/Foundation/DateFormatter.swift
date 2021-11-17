//
//  DateFormatter.swift
//  Utility
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import Foundation

private enum Consts {
    static let yesterday: Double = -86400.0
}

public extension Date {

    static var dateFormat: String {
       return "yyyy-MM-dd'T'HH:mm:ss'Z'"
    }
    
    static func date(from: String, with format: String = Date.dateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: from)
    }
    
    func toStringWithOnlyTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let today = dateFormatter.string(from: Date())
        let yesterdayDate = Date().addingTimeInterval(Consts.yesterday)
        let yesterday = dateFormatter.string(from: yesterdayDate)
        let date = dateFormatter.string(from: self)
        if date == today {
            dateFormatter.dateFormat = "HH:mm"
            return "Today " + dateFormatter.string(from: self)
        } else if date == yesterday {
            dateFormatter.dateFormat = "HH:mm"
            return "Yesterday " + dateFormatter.string(from: self)
        } else {
            dateFormatter.dateFormat = "dd.MM.yyyy        HH:mm"
        }
        
        return dateFormatter.string(from: self)
    }
}
