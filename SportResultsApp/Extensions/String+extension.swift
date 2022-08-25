//
//  String+extension.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

extension String {
    var toFullDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy h:mm:ss a"
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        return dateFormatter.date(from: self) ?? Date()
    }
    
    var toDatePart: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy h:mm:ss a"
        let showDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: showDate!)
    }
}
