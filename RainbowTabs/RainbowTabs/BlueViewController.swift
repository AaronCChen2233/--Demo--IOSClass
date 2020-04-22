//
//  BlueViewController.swift
//  RainbowTabs
//
//  Created by Aaron Chen on 2020-04-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    let centerBtn:UIButton = CenterButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Blue"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .blue
        view.addSubview(centerBtn)
        centerBtn.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        centerBtn.centerInSuperView()
    }
    
    @objc func goToNextViewController(_ sender: UIButton){
        /**go to GoViewController*/
        let gVC = GoViewController()
        gVC.color = navigationItem.title!
        navigationController?.pushViewController(gVC, animated: true)
    }
    

}
