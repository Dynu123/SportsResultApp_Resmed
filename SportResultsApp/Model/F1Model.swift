//
//  F1Model.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

struct F1: SportData, Codable, Equatable {
    var sportType: SportType?
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    var seconds: Float
    
    static func ==(lhs: F1, rhs: F1) -> Bool {
        return lhs.sportType == rhs.sportType && lhs.publicationDate == rhs.publicationDate && lhs.tournament == rhs.tournament && lhs.winner == rhs.winner && lhs.seconds == rhs.seconds
    }
}

extension F1 {
    static var sample = F1(sportType: .f1, publicationDate: "Oct 10, 1991 8:09:03 PM", tournament: "Cooking", winner: "Dyana Varghese", seconds: 1.02)
}
