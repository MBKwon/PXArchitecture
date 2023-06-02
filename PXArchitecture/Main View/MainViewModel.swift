//
//  MainViewModel.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/02.
//

import Foundation

class MainViewModel: PXViewModel {
    
    let dataRepository = PXDataRepository<[[String: String]]>()
    
    @discardableResult
    func bindTableView(_ tableView: PXTableView) -> Self {
        dataRepository.bindProcess {
            <#code#>
        }.data.fold { <#[[String : String]]#> in
            tableView
                .bindDataSource(numberOfRow: <#T##(Int) -> Int#>,
                                cellForIndexPath: <#T##(IndexPath) -> UITableViewCell#>)
                .bindDelegate(actionForIndexPath: <#T##(IndexPath) -> Void#>)
                .reloadData()
        } failure: { <#Error#> in
            <#code#>
        }
        
        return self
    }
}
