//
//  Restaurant.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct Restaurant : Hashable{
    var name : String
    var review : Float
    var categories : [RestaurantsCategories]
    var imagePath : String
}
