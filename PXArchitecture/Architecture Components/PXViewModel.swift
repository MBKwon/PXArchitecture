//
//  PXViewModel.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/01.
//

import Foundation

protocol PxUpdatable {
    func update()
}

class PXViewModel {
    
    private var updatableObjects: [PxUpdatable] = []
    
    func update() {
        updatableObjects.forEach { $0.update() }
    }
    
    func addUpdable(_ object: PxUpdatable) {
        self.updatableObjects.append(object)
    }
}
