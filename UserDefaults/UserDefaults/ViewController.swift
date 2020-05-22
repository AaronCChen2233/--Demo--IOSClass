//
//  ViewController.swift
//  UserDefaults
//
//  Created by Aaron Chen on 2020-05-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bluetoothSwitch: UISwitch!
  
    override func viewDidLoad() {
        super.viewDidLoad()
         let defaults = UserDefaults.standard
        if defaults.object(forKey: "switch") != nil{
            bluetoothSwitch.isOn = defaults.bool(forKey: "switch")
        }
    }

    @IBAction func saveSwitchState(_ sender: UISwitch) {
        /**save the state of the switch*/
        let defaults = UserDefaults.standard
        defaults.set(sender.isOn, forKey: "switch")
    }
}

