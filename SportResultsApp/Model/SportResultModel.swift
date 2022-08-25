//
//  SportResultModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation


struct APIResult: Codable {
    let f1Results: [F1]
    let nbaResults: [NBA]
    let Tennis: [Tennis]
}

struct SportResult {
    var id: UUID = UUID()
    var date: String
    var results: [SportData]
    
}


extension APIResult {
    static var sample = APIResult(f1Results: Array(repeating: .sample, count: 4), nbaResults: Array(repeating: .sample, count: 3), Tennis: Array(repeating: .sample, count: 2))
}
