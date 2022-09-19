//
//  NBAModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

// MARK: - NBA Model to hold data from API
struct NBA: SportData, Codable, Equatable {
    var sportType: SportType = .nba
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    let gameNumber: Int
    let mvp: String
    
    static func ==(lhs: NBA, rhs: NBA) -> Bool {
        return lhs.sportType == rhs.sportType && lhs.publicationDate == rhs.publicationDate && lhs.tournament == rhs.tournament && lhs.winner == rhs.winner && lhs.gameNumber == rhs.gameNumber && lhs.mvp == rhs.mvp
    }
    
    enum CodingKeys: String, CodingKey {
        case publicationDate, tournament, winner, gameNumber, mvp
    }
}

// MARK: - Extend NBA tp hold sample inputs
extension NBA {
    static var sample1 = NBA(sportType: .nba, publicationDate: "Apr 5, 1988 9:15:15 AM", tournament: "KCYM", winner: "Lijo", gameNumber: 3, mvp: "Kidengen")
    static var sample2 = NBA(sportType: .nba, publicationDate: "Oct 11, 1991 9:09:03 PM", tournament: "KCYM", winner: "Lijo", gameNumber: 3, mvp: "Kidengen")
}
