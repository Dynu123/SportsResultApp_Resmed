//
//  SportDataModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

// MARK: - Create protocol to hold the common parameters in all sport types
protocol SportData {
    var sportType: SportType { get set }
    var publicationDate: String { get }
    var tournament: String { get }
    var winner: String { get }
}
