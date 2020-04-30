//
//  ViewController.swift
//  TableView
//
//  Created by Aaron Chen on 2020-04-29.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

struct Employee {
    let image:String
    let name:String
    let position:String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let cellId = "namecell"
    @IBOutlet var tableView: UITableView!
    let names = ["Aaron", "Diego", "Naoki", "Richard", "kaden", "Andre", "Carlos", "Vlad", "Yuka", "Mika", "Yusuke", "Shohei", "Hotsuma", "Rick", "Wenda", "Daniel", "Douglas"]
    
    let position = ["Professional Clown", "Software Developer", "Designer", "Animal Trainer", "Uber Driver"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        /**data source - data*/
        /**delegate - action*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**1. ask for the cell (dequeue some requesable cell for me)*/
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        cell.detailTextLabel?.text = position[indexPath.row % position.count]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detial", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier as! DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            let row = indexPath.row
            
        }
    }
}

