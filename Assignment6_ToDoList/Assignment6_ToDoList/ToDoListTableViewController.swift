//
//  ToDoListTableViewController.swift
//  Assignment6_ToDoList
//
//  Created by Aaron Chen on 2020-05-02.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

enum TableSection: Int {
    case high = 0, medium, low
}

class ToDoListTableViewController: UITableViewController, AddTableViewControllerDelegate {
    var toDoSections = [TableSection: [ToDoItem]]()
    private let toDoId = "ToDoCell"
    var accessoryButtonTabIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.title = "To do list"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddToDoList))
        tableView.register(ToDoItemTableViewCell.self, forCellReuseIdentifier: toDoId)
        tableView.allowsMultipleSelectionDuringEditing = true
        
        // MARK: - Test Data
        toDoSections[.high] = [ToDoItem(name: "Apply tax refund", description: "Before 1, june", isDone: false),ToDoItem(name: "Buy some beers", description: "Kronenbourg 1664 Beer", isDone: false)]
        toDoSections[.medium] = [ToDoItem(name: "Finish Assignment 6", description: "", isDone: true)]
        toDoSections[.low] = [ToDoItem(name: "Learn new songs", description: "Learn new songs on violin", isDone:false)]
    }
    
    // MARK: - Present add view
    @objc func goToAddToDoList(_ sender: UIBarButtonItem) {
        let addVC = AddToDoItemViewController()
        addVC.delegate = self
        navigationController?.present(UINavigationController(rootViewController: addVC), animated: true)
    }
    
    // MARK: - Trash button tap
    @objc func deleteSelectItem(_ sender: UIBarButtonItem) {
        if let selectedRows = self.tableView.indexPathsForSelectedRows {
            /**Use sort by row reversal, Remove each from the last item for avoid out of range exception*/
            for selectionIndex in selectedRows.sorted(by: {$0.row > $1.row}){
                tableView(tableView, commit: .delete, forRowAt: selectionIndex)
            }
             navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    // MARK: - When add View tap save
    func save(toDoItem: ToDoItem) {
        toDoSections[.medium]?.append(toDoItem)
        tableView.insertRows(at: [IndexPath(row: toDoSections[.medium]!.count - 1, section: 1)], with: .automatic)
    }
    
    // MARK: - When edit tap save
    func editsave(toDoItem: ToDoItem){
        toDoSections[TableSection(rawValue: accessoryButtonTabIndex!.section)!]![accessoryButtonTabIndex!.row] = toDoItem
        tableView.reloadRows(at: [accessoryButtonTabIndex!], with: .automatic)
    }
    
    // MARK: - Section count
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: - Count for each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableSection = TableSection(rawValue: section), let toDoItem = toDoSections[tableSection] {
            return toDoItem.count
        }
        return 0
    }
    
    // MARK: - Load header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width - 30, height: 25))
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.backgroundColor = .systemGray6
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .high:
                label.text = "High priority"
            case .medium:
                label.text = "Medium priority"
            case .low:
                label.text = "Low priority"
            }
        }
        return label
    }
    
    // MARK: - Load
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: toDoId, for: indexPath) as! ToDoItemTableViewCell
        cell.accessoryType = .detailDisclosureButton
        if let tableSection = TableSection(rawValue: indexPath.section) ,let toDoItem = toDoSections[tableSection]?[indexPath.row]  {
            cell.updateUI(with: toDoItem)
        }
        return cell
    }
    
    // MARK: - Set cell heigh
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Edit Drag
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let toDoItemMove = toDoSections[TableSection(rawValue: sourceIndexPath.section)!]?[sourceIndexPath.row]
        toDoSections[TableSection(rawValue: destinationIndexPath.section)!]?.insert(toDoItemMove!, at: destinationIndexPath.row)
        toDoSections[TableSection(rawValue: sourceIndexPath.section)!]?.remove(at: sourceIndexPath.row)
    }
    
    // MARK: - Swap Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoSections[TableSection(rawValue: indexPath.section)!]?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Set add or trash button depend on which mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing{
            navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteSelectItem)), animated: true)
            /**Hadn't select so set right button disable*/
            navigationItem.rightBarButtonItem?.isEnabled = false
        }else{
            navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddToDoList)), animated: true)
        }
    }
    
    // MARK: - Item tap
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /**If is not editing*/
        if isEditing{
            navigationItem.rightBarButtonItem?.isEnabled = tableView.indexPathsForSelectedRows?.count != 0
        }else{
            toDoSections[TableSection(rawValue: indexPath.section)!]![indexPath.row].isDone.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - In EditingMode if didn't select any item disable trash button
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if isEditing{
            navigationItem.rightBarButtonItem?.isEnabled = tableView.indexPathsForSelectedRows != nil
        }
    }
    
    // MARK: - (i) button tapped
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let addVC = AddToDoItemViewController()
        addVC.edit(toDoSections[TableSection(rawValue: indexPath.section)!]![indexPath.row])
        addVC.delegate = self
        /**Save indexPath later save will use it*/
        accessoryButtonTabIndex = indexPath
        navigationController?.present(UINavigationController(rootViewController: addVC), animated: true)
    }
}
