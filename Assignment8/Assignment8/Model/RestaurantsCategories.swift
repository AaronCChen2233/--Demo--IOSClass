//
//  RestaurantsCategories.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

enum RestaurantsCategories : String, CaseIterable{
    case taiwanese = "Taiwanese"
    case mexican = "Mexican"
    case italian = "Italian"
    case japanese = "Japanese"
    case fastFood = "Fast Food"
    case vegetarianFriendly = "Vegetarian Fridendly"
    case bar = "Bar"
    case cafe = "Cafe"
    case breakfast = "Breafast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    
    init?(id : Int) {
        switch id {
        case 1: self = .taiwanese
        case 2: self = .mexican
        case 3: self = .italian
        case 4: self = .japanese
        case 5: self = .fastFood
        case 6: self = .vegetarianFriendly
        case 7: self = .bar
        case 8: self = .cafe
        case 9: self = .breakfast
        case 10: self = .lunch
        case 11: self = .dinner
        default: return nil
        }
    }
}
