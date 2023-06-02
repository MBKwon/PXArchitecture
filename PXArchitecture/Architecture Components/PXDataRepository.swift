//
//  PXDataRepository.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/02.
//

import Combine
import Foundation

enum PXDataRepositoryDataError: Error {
    case notInitialized
    case updateProcessNotInitialized
}

protocol PXDataUpdatable {
    associatedtype T
    associatedtype U
    
    func bindProcess(_ block: U) -> Self
    func update()
}

class PXDataRepository<Success>: PXDataUpdatable {
    
    typealias T = Success
    typealias U = (() -> Result<T, PXDataRepositoryDataError>)
    
    @Published var data: Result<T, PXDataRepositoryDataError>
    var updateClosure: U?
    
    init() {
        self.data = .failure(.notInitialized)
    }
    
    private convenience init(data: Result<T, PXDataRepositoryDataError>) {
        self.init()
    }
    
    func bindProcess(_ block: @escaping U) -> Self {
        self.updateClosure = block
    }
    
    func update() {
        if let updateBlock = self.updateClosure {
            self.data = updateBlock()
        } else {
            self.data = .failure(.updateProcessNotInitialized)
        }
    }
}
