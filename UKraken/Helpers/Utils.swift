//
//  Utils.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

class Utils {
    static func dateFormatter(_ s: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"

        if let date = dateFormatterGet.date(from: s) {
            return dateFormatterPrint.string(from: date)
        }
        
        return "There was an error decoding the string"
    }
    
    static func dateFormatterDateOrigin(_ s: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"

        if let date = dateFormatterGet.date(from: s) {
            return dateFormatterPrint.string(from: date)
        }
        
        return "There was an error decoding the string"
    }
}
