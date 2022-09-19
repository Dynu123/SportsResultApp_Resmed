//
//  F1Model.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

// MARK: - F1 Model to hold data from API
struct F1: SportData, Codable, Equatable {
    var sportType: SportType = .f1
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    var seconds: Float
    
    static func ==(lhs: F1, rhs: F1) -> Bool {
        return lhs.sportType == rhs.sportType && lhs.publicationDate == rhs.publicationDate && lhs.tournament == rhs.tournament && lhs.winner == rhs.winner && lhs.seconds == rhs.seconds
    }
    
    enum CodingKeys: String, CodingKey {
        case publicationDate, tournament, winner, seconds
    }
}

// MARK: - Extend F1 tp hold sample inputs
extension F1 {
    static var sample1 = F1(sportType: .f1, publicationDate: "Oct 10, 1991 8:09:03 PM", tournament: "Cooking", winner: "Dyana Varghese", seconds: 1.02)
    static var sample2 = F1(sportType: .f1, publicationDate: "Oct 11, 1991 8:09:03 PM", tournament: "Book reading", winner: "Dyana Varghese", seconds: 1.02)
}
