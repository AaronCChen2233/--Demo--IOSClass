//
//  StudentTableViewController.swift
//  TableViewDemoCode
//
//  Created by Aaron Chen on 2020-05-01.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    private let cellId = "StudentsCell"
    private let students = ["Derrick", "Aaron", "Daniel","Hotsuma"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Student"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddStudnt))
    }
    
    @objc func goToAddStudnt(_ sender:UIBarButtonItem){
        let addvc = AddViewController(style: .grouped)
        navigationController?.pushViewController(addvc, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailvc = DetailViewController()
        detailvc.name = students[indexPath.row]
        navigationController?.pushViewController(detailvc, animated: true)
    }
}
