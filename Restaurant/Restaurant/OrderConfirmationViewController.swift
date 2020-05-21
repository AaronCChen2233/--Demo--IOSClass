//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Aaron Chen on 2020-05-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    var minutes: Int!    
    @IBOutlet var timeRemainingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
}
