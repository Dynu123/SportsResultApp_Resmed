//
//  Test.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 21/08/22.
//

import Foundation
import Combine
import Alamofire

protocol SportsViewModelInputs {
    var state: ViewState<APIResult> { get }
}

class SportVM: ObservableObject, SportsViewModelInputs {
    
    @Published var finalDatasource: [SportResult] = []
    @Published public var state: ViewState<APIResult> = .loading
    @Published var navigate: Bool = false
    @Published var isLoading: Bool = false
    
    var dataChanged = PassthroughSubject<[SportResult], Never>()
    private var networkService: NetworkServiceProtocol
    private var bag: [AnyCancellable] = []
    
    public var inputs: SportsViewModelInputs {
        return self
    }
    
    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getResults() {
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
                for var eachf1 in apiResult.f1Results {
                    eachf1.sportType = .f1
                    results.append(eachf1)
                }
                for var eachnba in apiResult.nbaResults {
                    eachnba.sportType = .nba
                    results.append(eachnba)
                }
                for var eachtennis in apiResult.Tennis {
                    eachtennis.sportType = .tennis
                    results.append(eachtennis)
                }
                self.buildNewDatasource(from: results)
                self.state = .success(model: apiResult)
            case .failure(let error):
                guard let aferror = error as? AFError else {
                    return
                }
                print(aferror)
                self.state = .failure(error: error)
            }
        }.store(in: &bag)
    }
    
    
    func buildNewDatasource(from results: [SportData]) {
        let sortedResults = results.sorted(by: { $0.publicationDate.toFullDate.toCurrentTimezone() > $1.publicationDate.toFullDate.toCurrentTimezone() })
        var dateSet: [String] = []
        for each in sortedResults {
            if !dateSet.contains(each.publicationDate.toDatePart) {
                dateSet.append(each.publicationDate.toDatePart)
            }
        }
        finalDatasource.removeAll()
        for each in dateSet {
            let results = sortedResults.filter { result in
                each == result.publicationDate.toDatePart
            }
            finalDatasource.append(SportResult(date: each, results: results))
        }
        
    }
}
