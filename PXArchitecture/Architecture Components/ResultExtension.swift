//
//  ResultExtension.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/02.
//

import Foundation

extension Result {
    func fold(success successHandler: (Success) -> Void, failure failureHandler: (Error) -> Void) {
        switch self {
        case .success(let successValue):
            successHandler(successValue)
        case .failure(let error):
            failureHandler(error)
        }
    }
}
