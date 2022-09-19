//
//  TennisModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

// MARK: - Tennis Model to hold data from API
struct Tennis: SportData, Codable, Equatable {
    var sportType: SportType = .tennis
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    let numberOfSets: Int
    let looser: String
    
    static func ==(lhs: Tennis, rhs: Tennis) -> Bool {
        return lhs.sportType == rhs.sportType && lhs.publicationDate == rhs.publicationDate && lhs.tournament == rhs.tournament && lhs.winner == rhs.winner && lhs.numberOfSets == rhs.numberOfSets && lhs.looser == rhs.looser
    }
    
    enum CodingKeys: String, CodingKey {
        case publicationDate, tournament, winner, numberOfSets, looser
    }
}

// MARK: - Extend Tennis tp hold sample inputs
extension Tennis {
    static var sample = Tennis(sportType: .tennis, publicationDate: "Apr 4, 1987 11:15:15 PM", tournament: "Onam", winner: "Della", numberOfSets: 2, looser: "Joby")
}
