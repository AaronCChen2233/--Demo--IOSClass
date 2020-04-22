//
//  UIView+Constraints.swift
//  RainbowTabs
//
//  Created by Aaron Chen on 2020-04-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func centerInSuperView(){
        self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
    }
}
