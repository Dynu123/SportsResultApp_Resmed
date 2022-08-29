//
//  Test.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 21/08/22.
//

import Foundation
import Combine
import Alamofire


class SportVM: ObservableObject {
    @Published var finalDatasource: [SportResult] = []
    @Published var navigate: Bool = false
    @Published var isLoading: Bool = false
    
    private var networkService: NetworkServiceProtocol
    private var output: SportsVMOutputProtocol
    private var bag: [AnyCancellable] = []

    public init(networkService: NetworkServiceProtocol,
                output: SportsVMOutputProtocol) {
        self.networkService = networkService
        self.output = output
    }
    
    // MARK: - API call to fetch the results
    func getResults(completion: @escaping () -> Void) {
        navigate = false
        isLoading = true
        
        self.networkService.execute(API.getSportResults, model: APIResult.self) { [weak self] (result: Result<APIResult, AFError>) in
            guard let self = self else { return }
            self.navigate = true
            self.isLoading = false
            switch result {
            case .success(let apiResult):
                var results: [SportData] = []
                results.removeAll()
                if !apiResult.f1Results.isEmpty {
                    for var eachf1 in apiResult.f1Results {
                        eachf1.sportType = .f1
                        results.append(eachf1)
                    }
                }
                if !apiResult.nbaResults.isEmpty {
                    for var eachnba in apiResult.nbaResults {
                        eachnba.sportType = .nba
                        results.append(eachnba)
                    }
                }
                if !apiResult.Tennis.isEmpty {
                    for var eachtennis in apiResult.Tennis {
                        eachtennis.sportType = .tennis
                        results.append(eachtennis)
                    }
                }
                
                self.output.updateFinalDatasource(from: results)
                self.finalDatasource = self.output.finalDatasource
                completion() // for test case
            case .failure(let error):
                guard let _ = error  as AFError? else { return }
                self.output.updateFinalDatasource(from: [])
                completion()// for test case
            }
        }.store(in: &bag)
    }
}

