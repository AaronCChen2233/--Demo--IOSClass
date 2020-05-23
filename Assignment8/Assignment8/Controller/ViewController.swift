//
//  ViewController.swift
//  Assignment8
//
//  Created by Aaron Chen on 2020-05-21./Users/aaronchen/MyProjects/Project from other guys/SushiLover/SushiLover/Utils/UIView+ConstraintLayout.swift
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

/**
 (V)Feature #1: You will use a Navigation Controller with a custom title as the navigation bar title (i.e. My Restaurants).
 
 (V)Feature #2: You will be using two collection views for this project: one for the filter bar at the top and one for displaying the collection of restaurants.
 
 (V)Feature #3: The filter bar should contain at least 10 filter options and should be a scrollable collection view, similar to the filter bar in the Eatery app. You should make use of OR filtering options based on categories you define. If I select the “Mexican” and “Asian” options, the filter should display “Mexican OR Asian” restaurants. If I select the “American” and “Breakfast” options, the filter should display “American OR Breakfast” restaurants, etc
 
 (V)Feature #4: When you first open the app, all filter options are initially unselected. Clicking on a filter option will apply the filter and reload the collection view displaying the restaurants. Make sure you have some way of distinguishing between filter options that are selected and aren’t selected. In the example above, I use blue box tags to indicate selected options and white box tags to indicate unselected options.
 
 (V)Feature #5: You should have at least 10 restaurants in your app. In this case, you will need to create a Restaurant class that contains attributes associated with each restaurant. The attributes are completely up to you but a restaurant should have at least 3 attributes. In the example above, the attributes are the restaurant image, restaurant name, type of food (i.e. Mexican), meal time (i.e. Lunch), and cost (i.e. $).
 
 (V)Feature #6: The collection view displaying your restaurants must be in a grid layout such that there are two restaurants in each row.
 
 ()Challenge #3: Add in a search bar to search for restaurants using different attributes. For example, you could search for the restaurant’s name.
 
 ()Challenge #4: Add the use of AND filtering as an addition to Feature #3. For instance, in the example above, “Mexican”, “Asian”, and “American” are all in the same category (type of food) and “Breakfast” and “Lunch” are in the same category (meal time). If I select the “Mexican” and “Asian” options, the fil/Users/aaronchen/MyProjects/Project from other guys/SushiLover/SushiLover/Utils/UIColor+HexRgb.swiftter should display “Mexican OR Asian” restaurants because both options are from the same category. Meanwhile if I select the “American” and “Breakfast” options, the filter should display “American AND Breakfast” restaurants because both options are from different categories. If I select “Mexican”, “Asian”, and “Lunch” options, the filter should display “(Mexican OR Asian) AND Lunch” restaurants.
 */

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let categoriesCellId = "categoriesCell"
    let restaurantCellId = "restaurantCell"
    let categories = RestaurantsCategories.allCases
    let restaurnts = [
        Restaurant(name: "Bolero Cafe", review: 4.5, categories: [.cafe, .breakfast, .lunch, .dinner], imagePath: "bolero_cafe"),
        Restaurant(name: "Chef Chen beef noodles soup", review: 4, categories: [.taiwanese, .lunch, .dinner], imagePath: "chef_chen_beef_noodles_soup"),
        Restaurant(name: "Chishang Lunch Box", review: 5, categories: [.taiwanese, .lunch, .dinner], imagePath: "chishang_lunch_box"),
        Restaurant(name: "Din Tai Fung", review: 4.5, categories: [.taiwanese, .lunch, .dinner], imagePath: "din_tai_fung"),
        Restaurant(name: "Every Day Ramen", review: 3.5, categories: [.japanese, .lunch, .dinner], imagePath: "every_day_ramen"),
        Restaurant(name: "Happy Day fast food", review: 3.3, categories: [.fastFood, .breakfast, .lunch, .dinner, .vegetarianFriendly], imagePath: "happy_day_fast_food"),
        Restaurant(name: "Smoking Joe", review: 3.0, categories: [.fastFood, .lunch, .dinner], imagePath: "smoking_joe"),
        Restaurant(name: "Steam Bar", review: 4.2, categories: [.bar, .lunch, .dinner], imagePath: "steam_bar"),
        Restaurant(name: "Super Pizza", review: 5.0, categories: [.italian, .italian, .lunch, .dinner], imagePath: "super_pizza"),
        Restaurant(name: "Taiwan Bar", review: 5.0, categories: [.taiwanese, .bar, .lunch, .dinner], imagePath: "taiwan_bar"),
        Restaurant(name: "Tocos", review: 4.5, categories: [.mexican, .breakfast, .vegetarianFriendly, .lunch, .dinner], imagePath: "tocos"),
        Restaurant(name: "Trattoria pasta", review: 2.0, categories: [.italian, .vegetarianFriendly, .lunch, .dinner], imagePath: "trattoria_pasta"),
        Restaurant(name: "Umami Sushi", review: 5.0, categories: [.japanese, .lunch, .dinner], imagePath: "umami_sushi"),
        Restaurant(name: "Vegetable Lover", review: 1.0, categories: [.vegetarianFriendly, .breakfast, .lunch, .dinner], imagePath: "vegetable_lover"),
        Restaurant(name: "yamato", review: 4.5, categories: [.japanese, .lunch, .dinner], imagePath: "yamato_japanes_food")
    ]
    var filteredRestaurnts = [Restaurant]()
    var categoriesCollectionView : UICollectionView!
    var restaurntCollectionView : UICollectionView!
    var selectedCategories = [RestaurantsCategories]()
    var isFiltering: Bool {
        return selectedCategories.count != 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Restaurants List"
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x4A7BD3)
        view.backgroundColor = .white
        
        /**categoriesCollectionView setting*/
        let categoriesCollectionViewLayout = UICollectionViewFlowLayout()
        categoriesCollectionViewLayout.scrollDirection = .horizontal
        categoriesCollectionViewLayout.minimumInteritemSpacing = 8
        categoriesCollectionViewLayout.minimumLineSpacing = 16
        categoriesCollectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: categoriesCollectionViewLayout)
        view.addSubview(categoriesCollectionView)
        categoriesCollectionView.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, padding: .zero, size: CGSize(width: 0, height: 50))
        categoriesCollectionView.backgroundColor = .white
        categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: categoriesCellId)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.allowsMultipleSelection = true
        
        /**restaurntCollectionView setting*/
        let restaurntCollectionViewLayout = UICollectionViewFlowLayout()
        restaurntCollectionViewLayout.scrollDirection = .vertical
        restaurntCollectionViewLayout.minimumInteritemSpacing = 8
        restaurntCollectionViewLayout.minimumLineSpacing = 8
        restaurntCollectionView = UICollectionView(frame: .zero, collectionViewLayout: restaurntCollectionViewLayout)
        view.addSubview(restaurntCollectionView)
        restaurntCollectionView.anchors(topAnchor: categoriesCollectionView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor, padding: .zero)
        restaurntCollectionView.backgroundColor = .white
        restaurntCollectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: restaurantCellId)
        restaurntCollectionView.dataSource = self
        restaurntCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView{
            return categories.count
        }else{
            return isFiltering ? filteredRestaurnts.count : restaurnts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesCellId, for: indexPath) as! CategoryCollectionViewCell
            cell.categoryLable.text = categories[indexPath.row].rawValue
            cell.category = categories[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantCellId, for: indexPath) as! RestaurantCollectionViewCell
            let restaura = isFiltering ? filteredRestaurnts[indexPath.row] : restaurnts[indexPath.row]
            cell.restaurantImage.image = UIImage(named: restaura.imagePath)
            cell.restauranNameLable.text = restaura.name
            cell.restauranCategories.text = restaura.categories.map{$0.rawValue}.joined(separator: ", ")
            cell.restauranReview.text = "⭐️ " + String(restaura.review)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView{
            if collectionView.indexPathsForSelectedItems?.filter({$0 == indexPath}).count != 0{
                if let index = selectedCategories.firstIndex(of: categories[indexPath.row]) {
                    selectedCategories.remove(at: index)
                }
            }else{
                selectedCategories.append(categories[indexPath.row])
            }
            selectedCategories.removeDuplicates()
        }
        
        filteredRestaurnts = [Restaurant]()
        for selectedCategory in selectedCategories{
            filteredRestaurnts += restaurnts.filter({$0.categories.filter{$0 == selectedCategory}.count > 0})
        }
        
        filteredRestaurnts = filteredRestaurnts.removingDuplicates()
        restaurntCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 2 * 8) / 2
        return CGSize(width: size, height: size)
    }
}
