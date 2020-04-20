//
//  RedViewController.swift
//  Navigation_Controller
//
//  Created by Aaron Chen on 2020-04-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    /**dependency injection*/
    var user: User!/**implicitly unwrapped optional*/
    
    @IBOutlet var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(user.name)'s hobby is \(user.hobby)"
        print(user.name)
        print(user.hobby)
    }
}
