//
//  ResultsView.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 24/08/22.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var sportVM: SportVM
    @State var didClick: Bool = false
    @State var selectedIndex: Int = -1
    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .center, spacing: 16) {
//                ForEach(sportVM.finalDatasource.indices, id: \.self) { index in
//                    Text("Results for \(sportVM.finalDatasource[index].date)")
//                        .fontWeight(.bold)
//                        .font(.system(.title, design: .rounded))
//                        .foregroundColor(.primary)
//                        .onTapGesture {
//                            withAnimation {
//                                if selectedIndex == index {
//                                    selectedIndex = -1
//                                } else {
//                                    selectedIndex = index
//                                }
//                            }
//                        }
//                    if selectedIndex == index {
//                        ResultSubView(result: sportVM.finalDatasource[index])
//                    }
//                }
//            }
//        }
//    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                ForEach(sportVM.finalDatasource.indices, id: \.self) { index in
                    DisclosureGroup {
                        ResultSubView(result: sportVM.finalDatasource[index])
                    } label: {
                        Text("Results for \(sportVM.finalDatasource[index].date)")
                            .fontWeight(.bold)
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    .accentColor(.primary)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}




