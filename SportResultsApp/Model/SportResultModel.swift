//
//  SportResultModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation


// MARK: - Model to decode JSON data
struct APIResult: Codable {
    let f1Results: [F1]
    let nbaResults: [NBA]
    let Tennis: [Tennis]
}

// MARK: - Final model for displaying data in the view
struct SportResult {
    var id: UUID = UUID()
    var date: String
    var results: [SportData]
    
}

extension APIResult {
    static var sample = APIResult(f1Results: [.sample1, .sample2], nbaResults: [.sample1, .sample2], Tennis: Array(repeating: .sample, count: 1))
    
    static var sampleWithNoF1 = APIResult(f1Results: [], nbaResults: [.sample1, .sample2], Tennis: Array(repeating: .sample, count: 1))
    
    static var sampleWithNoNBA = APIResult(f1Results: [.sample1, .sample2], nbaResults: [], Tennis: Array(repeating: .sample, count: 1))
    
    static var sampleWithNoTennis = APIResult(f1Results: [.sample1, .sample2], nbaResults: [.sample1, .sample2], Tennis: [])
    
    static var sampleWithNoResults = APIResult(f1Results: [], nbaResults: [], Tennis: [])
}
