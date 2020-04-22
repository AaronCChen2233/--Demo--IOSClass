//
//  GoViewController.swift
//  RainbowTabs
//
//  Created by Aaron Chen on 2020-04-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class GoViewController: UIViewController {
    var color: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "from \(color!)"
    }
    
}
