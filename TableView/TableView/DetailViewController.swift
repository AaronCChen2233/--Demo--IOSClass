//
//  DetailViewController.swift
//  TableView
//
//  Created by Aaron Chen on 2020-04-29.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var positionLable: UILabel!
    
    var employee : Employee!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
