//
//  API.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 24/08/22.
//

import Foundation
import Alamofire

// MARK: - Create API enum conforming to URLRequestBuilder, add the api name
enum API: URLRequestBuilder {
    case getSportResults
}

// MARK: - Extend API to implement the inputs
extension API {

    var path: String {
        switch self {
        case .getSportResults:
            return "/results"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getSportResults:
            return nil
        }
    }
        
    var method: HTTPMethod {
        switch self {
        case .getSportResults:
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getSportResults:
            return ["Content-Type": "application/json"]
        }
    }
    
}
