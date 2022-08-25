//
//  ViewState.swift
//  SportResultsApp
//
//  Created by Dyana Varghese on 25/08/22.
//

import Foundation
import Alamofire

enum ViewState<Model> {
    case loading
    case success(model: Model)
    case loadingMore(model: Model)
    case failure(error: AFError)
    case noData(message: String)

    var shouldLoad: Bool {
        switch self {
        case .loading,
             .loadingMore,
             .noData:
            return true
        case .failure,
             .success:
            return false
        }
    }
}

extension ViewState: Equatable {

    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading),
             (.success, .success),
             (.failure, .failure):
            return true
        default:
            return false
        }
    }
}
