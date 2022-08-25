//
//  Date+extension.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

extension Date {
    func toCurrentTimezone() -> Date {
        let timeZoneDifference =
        TimeInterval(TimeZone.current.secondsFromGMT())
        return self.addingTimeInterval(timeZoneDifference)
   }
}
