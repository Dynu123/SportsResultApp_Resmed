//
//  MockNetworkService.swift
//  SportResultsAppTests
//
//  Created by Dyana Varghese on 26/08/22.
//

import XCTest
@testable import SportResultsApp
import Combine
import Alamofire


// MARK: - Class for mocking NetworkServiceProtocol
class MockNetworkService: NetworkServiceProtocol {
    
    var fetchSportsResult: AnyPublisher<APIResult, Error>?
    
    func execute<T>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable where T : Decodable, T : Encodable {
        if let result = fetchSportsResult?.eraseToAnyPublisher() {
            let cancellable =  result
                .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
                .receive(on: RunLoop.main)
                .sink { errorCompletion in
                    switch errorCompletion {
                    case .failure(let error):
                        completion(.failure(error as! AFError))
                    case .finished: break
                    }
                    
                } receiveValue: { response in
                    completion(.success(response as! T))
                }
            return cancellable
        } else {
            fatalError("Result cannot be nil")
        }
    }
}
