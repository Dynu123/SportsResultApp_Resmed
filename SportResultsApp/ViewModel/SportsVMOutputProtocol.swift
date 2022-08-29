//
//  Output.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 28/08/22.
//

import Foundation

// MARK: - Protocol to calculate the final datasource in chronological order(most recent first)
protocol SportsVMOutputProtocol: AnyObject {
    var finalDatasource: [SportResult] { get set }
    func updateFinalDatasource(from results: [SportData])
}

class Output: SportsVMOutputProtocol {
    var finalDatasource: [SportResult] = []
    
    func updateFinalDatasource(from results: [SportData]) {
        let sortedResults = results.sorted(by: { $0.publicationDate.toFullDate.toCurrentTimezone() > $1.publicationDate.toFullDate.toCurrentTimezone() })
        var dateSet: [String] = []
        for each in sortedResults {
            if !dateSet.contains(each.publicationDate.toDatePart) {
                dateSet.append(each.publicationDate.toDatePart)
            }
        }
        finalDatasource.removeAll()
        for each in dateSet {
            let results = sortedResults.filter { result in
                each == result.publicationDate.toDatePart
            }
            finalDatasource.append(SportResult(date: each, results: results))
        }
    }
}
