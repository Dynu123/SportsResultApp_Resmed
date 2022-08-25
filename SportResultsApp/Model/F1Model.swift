//
//  F1Model.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

struct F1: SportData, Codable {
    var sportType: SportType?
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    var seconds: Float
}

extension F1 {
    static var sample = F1(sportType: .f1, publicationDate: "09-02-2022", tournament: "abc", winner: "rafael", seconds: 0.5)
}
