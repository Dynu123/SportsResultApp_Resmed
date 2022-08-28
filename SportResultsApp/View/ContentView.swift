//
//  ContentView.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 21/08/22.
//

import SwiftUI
import Foundation
import Alamofire

struct ContentView: View {
    @ObservedObject var sportVM: SportVM
    
    init() {
        sportVM = SportVM(networkService: NetworkService.default, output: Output())
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                NavigationLink(isActive: $sportVM.navigate) {
                    ResultsView().environmentObject(sportVM)
                } label: {
                    EmptyView()
                }.hidden()
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .top)
                VStack {
                    Spacer()
                    Button {
                        sportVM.getResults(completion: {})
                    } label: {
                        HStack {
                            Text("Show results")
                                .fontWeight(.semibold)
                                .font(.body)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.red, .blue, .green]),
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing))
                        .cornerRadius(40)
                        .padding()
                    }
                }
                if sportVM.isLoading {
                    LoadingAnimationView {
                        Text("Fetching results...")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
