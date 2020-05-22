//
//  ViewController.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-21.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

/**
 Feature #1: You will use a Navigation Controller with a custom title as the navigation bar title (i.e. My Restaurants).
 
 Feature #2: You will be using two collection views for this project: one for the filter bar at the top and one for displaying the collection of restaurants.
 
 Feature #3: The filter bar should contain at least 10 filter options and should be a scrollable collection view, similar to the filter bar in the Eatery app. You should make use of OR filtering options based on categories you define. If I select the “Mexican” and “Asian” options, the filter should display “Mexican OR Asian” restaurants. If I select the “American” and “Breakfast” options, the filter should display “American OR Breakfast” restaurants, etc
 
 Feature #4: When you first open the app, all filter options are initially unselected. Clicking on a filter option will apply the filter and reload the collection view displaying the restaurants. Make sure you have some way of distinguishing between filter options that are selected and aren’t selected. In the example above, I use blue box tags to indicate selected options and white box tags to indicate unselected options.
 
 Feature #5: You should have at least 10 restaurants in your app. In this case, you will need to create a Restaurant class that contains attributes associated with each restaurant. The attributes are completely up to you but a restaurant should have at least 3 attributes. In the example above, the attributes are the restaurant image, restaurant name, type of food (i.e. Mexican), meal time (i.e. Lunch), and cost (i.e. $).
 
 Feature #6: The collection view displaying your restaurants must be in a grid layout such that there are two restaurants in each row.
 
 Challenge #3: Add in a search bar to search for restaurants using different attributes. For example, you could search for the restaurant’s name.
 
 Challenge #4: Add the use of AND filtering as an addition to Feature #3. For instance, in the example above, “Mexican”, “Asian”, and “American” are all in the same category (type of food) and “Breakfast” and “Lunch” are in the same category (meal time). If I select the “Mexican” and “Asian” options, the filter should display “Mexican OR Asian” restaurants because both options are from the same category. Meanwhile if I select the “American” and “Breakfast” options, the filter should display “American AND Breakfast” restaurants because both options are from different categories. If I select “Mexican”, “Asian”, and “Lunch” options, the filter should display “(Mexican OR Asian) AND Lunch” restaurants.
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
}

