//
//  ViewController.swift
//  Light
//
//  Created by Aaron Chen on 2020-04-17.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
    
//    @IBOutlet var lightButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
//        if lightOn {
//            view.backgroundColor = .white
//            lightButton.setTitle("Off", for: .normal)
//
//        } else {
//            view.backgroundColor = .black
//            lightButton.setTitle("On", for: .normal)
//        }
    }
}

