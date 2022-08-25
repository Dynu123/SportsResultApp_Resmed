//
//  TennisModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

struct Tennis: SportData, Codable {
    var sportType: SportType?
    
    var publicationDate: String = ""
    
    var tournament: String = ""
    
    var winner: String = ""
    
    let numberOfSets: Int
    let looser: String
}

extension Tennis {
    static var sample = Tennis(sportType: .tennis, publicationDate: "09-02-2022", tournament: "abc", winner: "rafael", numberOfSets: 2, looser: "radfel")
}
