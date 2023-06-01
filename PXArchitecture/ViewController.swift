//
//  ViewController.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: PXTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.bindDataSource(numberOfRow: <#T##(Int) -> Int#>, cellForIndexPath: <#T##(IndexPath) -> UITableViewCell#>)
    }
}

