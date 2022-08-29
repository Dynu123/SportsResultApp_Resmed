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
    
    // MARK: - Declare parameters for depedency injection by creating mock network service and mock sports output
    var viewModel: SportVM!
    var networkService: MockNetworkService!
    var output: MockSportsVMOutput!
    
    override func setUp() {
        networkService = MockNetworkService()
        output = MockSportsVMOutput()
        viewModel = .init(networkService: networkService, output: output)
    }
    
    
    // MARK: - Test for validating data on successfull API call
    func testDatasource_onAPIcall_success() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sample).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 4)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "11-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "10-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[2].date, "05-04-1988")
        XCTAssertEqual(viewModel.finalDatasource[3].date, "04-04-1987")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! NBA, NBA.sample2)
        XCTAssertEqual(viewModel.finalDatasource[0].results[1] as! F1, F1.sample2)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! F1, F1.sample1)
        XCTAssertEqual(viewModel.finalDatasource[2].results[0] as! NBA, NBA.sample1)
        XCTAssertEqual(viewModel.finalDatasource[3].results[0] as! Tennis, Tennis.sample)
    }
    
    // MARK: - Test for validating data on API call failure
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
    
    // MARK: - Test for validating data on sucessfull API call but response has no F1 results
    func testDatasource_onAPIcall_success_withNoF1Results() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoF1).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 3)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "11-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "05-04-1988")
        XCTAssertEqual(viewModel.finalDatasource[2].date, "04-04-1987")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! NBA, NBA.sample2)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! NBA, NBA.sample1)
        XCTAssertEqual(viewModel.finalDatasource[2].results[0] as! Tennis, Tennis.sample)
    }
    
    // MARK: - Test for validating data on sucessfull API call but response has no NBA results
    func testDatasource_onAPIcall_success_withNoNBAResults() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoNBA).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 3)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "11-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "10-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[2].date, "04-04-1987")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! F1, F1.sample2)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! F1, F1.sample1)
        XCTAssertEqual(viewModel.finalDatasource[2].results[0] as! Tennis, Tennis.sample)
    }
    
    // MARK: - Test for validating data on sucessfull API call but response has no Tennis results
    func testDatasource_onAPIcall_success_withNoTennisResults() throws {
        networkService.fetchSportsResult = CurrentValueSubject(APIResult.sampleWithNoTennis).eraseToAnyPublisher()
        let expectation = expectation(description: "wait for completion")
        viewModel.getResults {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(viewModel.finalDatasource)
        XCTAssertEqual(viewModel.finalDatasource.count, 3)
        XCTAssertEqual(viewModel.finalDatasource[0].date, "11-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[1].date, "10-10-1991")
        XCTAssertEqual(viewModel.finalDatasource[2].date, "05-04-1988")
        XCTAssertEqual(viewModel.finalDatasource[0].results[0] as! NBA, NBA.sample2)
        XCTAssertEqual(viewModel.finalDatasource[0].results[1] as! F1, F1.sample2)
        XCTAssertEqual(viewModel.finalDatasource[1].results[0] as! F1, F1.sample1)
        XCTAssertEqual(viewModel.finalDatasource[2].results[0] as! NBA, NBA.sample1)
    }
    
    // MARK: - Test for validating data on sucessfull API call but response has no results declared
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
