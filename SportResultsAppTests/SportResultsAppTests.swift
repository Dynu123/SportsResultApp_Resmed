//
//  SportResultsAppTests.swift
//  SportResultsAppTests
//
//  Created by Dyana Varghese on 25/08/22.
//

import XCTest
@testable import SportResultsApp
import Alamofire
import Combine

class SportResultsAppTests: XCTestCase {
    var viewModel: SportVM!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        mockNetworkService = MockNetworkService.default as? MockNetworkService
        viewModel = .init(networkService: mockNetworkService)
    }
    
    func testViewModel() {
        viewModel.getResults()
        XCTAssertTrue(viewModel.finalDatasource.count != 0, "Array is empty")
    }
}


final class MockNetworkService: NetworkServiceProtocol {
    static let `default`: NetworkServiceProtocol = {
        var service = MockNetworkService()
        return service
    }()
}
