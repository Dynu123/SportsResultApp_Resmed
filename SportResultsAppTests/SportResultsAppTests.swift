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
    var networkService: MockNetworkService!
    var output: MockSportsVMOutput!
    
    override func setUp() {
        networkService = MockNetworkService()
        output = MockSportsVMOutput()
        viewModel = .init(networkService: networkService, output: output)
    }
    
    func testDatasource_onAPIcall_success() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sample).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 3)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "10-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "05-04-1988")
        XCTAssertEqual(viewModel.finalDatasource[2].date, "04-04-1987")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! F1, F1.sample)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! NBA, NBA.sample)
        XCTAssertEqual(viewModel.finalDatasource[2].results[0] as! Tennis, Tennis.sample)
    }
    
    func testDatasource_onAPIcall_failure() throws {
        let error = AFError.createURLRequestFailed(error: NSError())
        networkService.fetchSportsResult = Fail(error: error).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 0)
    }
    
    func testDatasource_onAPIcall_success_withNoF1Results() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoF1).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 2)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "05-04-1988")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "04-04-1987")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! NBA, NBA.sample)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! Tennis, Tennis.sample)
    }
    
    func testDatasource_onAPIcall_success_withNoNBAResults() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoNBA).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 2)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "10-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "04-04-1987")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! F1, F1.sample)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! Tennis, Tennis.sample)
    }
    
    func testDatasource_onAPIcall_success_withNoTennisResults() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoTennis).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 2)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "10-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "05-04-1988")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! F1, F1.sample)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! NBA, NBA.sample)
    }
    
    func testDatasource_onAPIcall_success_withNoResults() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoResults).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 0)
    }

}
