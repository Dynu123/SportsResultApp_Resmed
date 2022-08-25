//
//  NBAModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

struct NBA: SportData, Codable {
    var sportType: SportType?
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    let gameNumber: Int
    let mvp: String
}

extension NBA {
    static var sample = NBA(sportType: .nba, publicationDate: "09-02-2022", tournament: "abc", winner: "rafael", gameNumber: 3, mvp: "rafel")
}
