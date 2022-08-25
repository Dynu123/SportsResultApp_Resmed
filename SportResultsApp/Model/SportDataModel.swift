//
//  SportDataModel.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 23/08/22.
//

import Foundation

protocol SportData {
    var sportType: SportType? { get }
    var publicationDate: String { get }
    var tournament: String { get }
    var winner: String { get }
}
