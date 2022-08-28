//
//  ResultsView.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 24/08/22.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var sportVM: SportVM
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                ForEach(sportVM.finalDatasource.indices, id: \.self) { index in
                    DisclosureGroup {
                        ResultSubView(result: sportVM.finalDatasource[index])
                    } label: {
                        Text("\(sportVM.finalDatasource[index].date)")
                            .fontWeight(.bold)
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(Color.primary.opacity(0.7))
                            .padding(.bottom, 5)
                    }
                    .accentColor(Color.primary.opacity(0.7))
                }
            }
            .padding(16)
        }
        .background(LinearGradient(gradient: Gradient(colors: [.red.opacity(0.3),
                                                               .blue.opacity(0.3),
                                                               .green.opacity(0.3)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all))
        .navigationTitle("Results")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.primary)
                }
            }
        }
    }
}




