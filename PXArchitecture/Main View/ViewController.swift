//
//  ViewController.swift
//  PXArchitecture
//
//  Created by Moonbeom KWON on 2023/06/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: PXTableView!
    
    var viewModel: MainViewModel = MainViewModel() {
        didSet {
            viewModel.bindTableView(tableView).update()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

