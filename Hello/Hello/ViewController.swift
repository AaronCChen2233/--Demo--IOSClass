//
//  ViewController.swift
//  Hello
//
//  Created by Aaron Chen on 2020-04-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myButton: UIButton!
    private let nameLable : UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
    var c = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /**initialize properties subviews or view*/
        myButton.setTitle("YES!", for: .normal)
        view.addSubview(nameLable)
        nameLable.text="Aaron"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        c+=1
        print("Button tapped " + String(c))
    }
}

