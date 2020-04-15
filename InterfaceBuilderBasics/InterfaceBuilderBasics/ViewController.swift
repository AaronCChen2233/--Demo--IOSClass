//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Aaron Chen on 2020-04-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressButtontap(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
    
}

