//
//  SnacksTableViewController.swift
//  Assignment_Animation
//
//  Created by Aaron Chen on 2020-05-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class SnacksTableViewController: UITableViewController {
    var snacks : [String] = []
    let cellId = "snack"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = snacks[indexPath.row]
        return cell
    }
    
    func addSnack(snack: String) {
        snacks.insert(snack, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
