//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Aaron Chen on 2020-05-20.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var detailTextLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    
    var menuItem: MenuItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        guard let menuItem = menuItem else { return }
        coder.encode(menuItem.id, forKey: "menuItemId")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    
        let menuItemID = Int(coder.decodeInt32(forKey: "menuItemId"))
        menuItem = MenuController.shared.item(withID: menuItemID)!
        updateUI()
    }
    
    func updateUI() {
        guard let menuItem = menuItem else { return }
        
            titleLabel.text = menuItem.name
            priceLabel.text = String(format: "$%.2f", menuItem.price)
            detailTextLabel.text = menuItem.detailText
            MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let menuItem = menuItem else { return }
        UIView.animate(withDuration: 0.1) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        MenuController.shared.order.menuItems.append(menuItem)
    }
}
