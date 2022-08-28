//
//  NBAModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

struct NBA: SportData, Codable, Equatable {
    var sportType: SportType?
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    let gameNumber: Int
    let mvp: String
    
    static func ==(lhs: NBA, rhs: NBA) -> Bool {
        return lhs.sportType == rhs.sportType && lhs.publicationDate == rhs.publicationDate && lhs.tournament == rhs.tournament && lhs.winner == rhs.winner && lhs.gameNumber == rhs.gameNumber && lhs.mvp == rhs.mvp
    }
}

extension NBA {
    static var sample = NBA(sportType: .nba, publicationDate: "Apr 5, 1988 9:15:15 AM", tournament: "KCYM", winner: "Lijo", gameNumber: 3, mvp: "Kidengen")
}
