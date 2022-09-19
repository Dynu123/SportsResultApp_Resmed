//
//  ResultSubView.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 24/08/22.
//

import SwiftUI

struct ResultSubView: View {
    var result: SportResult
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(result.results, id: \.publicationDate) { value in
                switch value.sportType {
                case .f1:
                    let seconds = (value as? F1)?.seconds ?? 0.0
                    ScoreView(content: "\(value.winner) wins \(value.tournament) by \(seconds) seconds", sportColor: .red)
                case .nba:
                    let mvp = (value as? NBA)?.mvp ?? ""
                    let gameNumber = (value as? NBA)?.gameNumber ?? 0
                    ScoreView(content: "\(mvp) leads \(value.winner) to game \(gameNumber) win in the \(value.tournament)", sportColor: .blue)
                case .tennis:
                    let looser = (value as? Tennis)?.looser ?? ""
                    let numberOfSets = (value as? Tennis)?.numberOfSets ?? 0
                    ScoreView(content: "\(value.tournament): \(value.winner) wins against \(looser) in \(numberOfSets) sets", sportColor: .green)
                
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
