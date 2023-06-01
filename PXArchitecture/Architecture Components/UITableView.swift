//
//  UITableView.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/01.
//

import UIKit

class PXTableView: UITableView {
    
    private var numberOfSection: () -> Int = {
        return 1
    }
    
    private var numberOfRow: (Int) -> Int = { section in
        return 0
    }
    
    private var cellForIndexPath: (IndexPath) -> UITableViewCell = { indexPath in
        return UITableViewCell()
    }
    
    private var actionForIndexPath: ((IndexPath) -> Void)?
}

extension PXTableView {
    @discardableResult
    func bindDataSource(numberOfSection: (() -> Int)? = nil,
                        numberOfRow: @escaping (Int) -> Int,
                        cellForIndexPath: @escaping (IndexPath) -> UITableViewCell) -> Self {
        
        if let numberOfSection = numberOfSection {
            self.numberOfSection = numberOfSection
        }
        
        self.numberOfRow = numberOfRow
        self.cellForIndexPath = cellForIndexPath
        
        return self
    }
    
    @discardableResult
    func bindDelegate(actionForIndexPath: @escaping (IndexPath) -> Void) -> Self {
        self.actionForIndexPath = actionForIndexPath
        
        return self
    }
}

extension PXTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRow(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cellForIndexPath(indexPath)
    }
}

extension PXTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.actionForIndexPath?(indexPath)
    }
}
