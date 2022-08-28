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
    static var sample = APIResult(f1Results: Array(repeating: .sample, count:  1), nbaResults: Array(repeating: .sample, count: 1), Tennis: Array(repeating: .sample, count: 1))
    
    static var sampleWithNoF1 = APIResult(f1Results: [], nbaResults: Array(repeating: .sample, count: 1), Tennis: Array(repeating: .sample, count: 1))
    
    static var sampleWithNoNBA = APIResult(f1Results: Array(repeating: .sample, count:  1), nbaResults: [], Tennis: Array(repeating: .sample, count: 1))
    
    static var sampleWithNoTennis = APIResult(f1Results: Array(repeating: .sample, count:  1), nbaResults: Array(repeating: .sample, count: 1), Tennis: [])
    
    static var sampleWithNoResults = APIResult(f1Results: [], nbaResults: [], Tennis: [])
}
