//
//  ScoreView.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 24/08/22.
//

import SwiftUI


struct ScoreView: View {
    var content: String
    var sportColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 4)
            
            HStack {
                Rectangle().cornerRadius(10, corners: [.topLeft, .bottomLeft]).frame(width: 20).foregroundColor(sportColor)
                VStack(spacing: 0) {
                    Text(content)
                        .foregroundColor(Color.secondary)
                        .padding(8)
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(5)
                .multilineTextAlignment(.center)
                .background(sportColor.opacity(0.3))
                Rectangle().cornerRadius(10, corners: [.topRight, .bottomRight]).frame(width: 20).foregroundColor(sportColor)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView().environmentObject(SportVM(networkService: NetworkService()))
    }
}
