//
//  Order.swift
//  Restaurant
//
//  Created by Aaron Chen on 2020-05-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]

    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
