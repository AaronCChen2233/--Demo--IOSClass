//
//  DetailViewController.swift
//  TableViewDemoCode
//
//  Created by Aaron Chen on 2020-05-01.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    var name : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
           navigationItem.title = name
    }
}
