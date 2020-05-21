//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Aaron Chen on 2020-05-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var category: String?
    //    let menuController = MenuController()
    var menuItems = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: MenuController.menuDataUpdatedNotification, object: nil)
        
        guard let category = category else { return }
        MenuController.shared.fetchMenuItems(forCategory: category)
        { (menuItems) in
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        guard let category = category else { return }
        coder.encode(category, forKey: "category")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        category = (coder.decodeObject(forKey: "category") as? String)
        updateUI()
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        MenuController.shared.fetchImage(url: menuItem.imageURL)
        { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath != indexPath {
                    return
                }
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
        }
    }
    
    @objc func updateUI() {
        guard let category = category else { return }
        title = category.capitalized
        self.menuItems = MenuController.shared.items(forCategory:category) ?? []
        self.tableView.reloadData()
    }
    
}
