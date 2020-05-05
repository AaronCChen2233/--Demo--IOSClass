//
//  AddToDoItemViewController.swift
//  Assignment6_ToDoList
//
//  Created by Aaron Chen on 2020-05-02.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class {
    func save(toDoItem: ToDoItem)
    func editsave(toDoItem: ToDoItem)
}

class AddToDoItemViewController: UIViewController {
    
    weak var delegate: AddTableViewControllerDelegate?
    var isEditingMode: Bool = false
    var toDoItem : ToDoItem?
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18)
        lb.text = "To do:"
        return lb
    }()
    
    let nameTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "To do"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18)
        lb.text = "Description(Optional):"
        return lb
    }()
    
    let descriptionField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Description"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewToDoItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        
        /**Different Mode show different title*/
        if isEditingMode{
            navigationItem.title = "Edit"
        }else{
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationItem.title = "Add new to do"
        }
        
        let sv = UIStackView()
        view.addSubview(sv)
        
        nameTextField.addTarget(self, action: #selector(nameTextFieldTextEditing(_:)), for: UIControl.Event.editingChanged)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        sv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        sv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        sv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sv.distribution = .equalSpacing
        
        sv.axis = .vertical
        sv.addArrangedSubview(nameLabel)
        sv.addArrangedSubview(nameTextField)
        sv.addArrangedSubview(descriptionLabel)
        sv.addArrangedSubview(descriptionField)
    }
    
    // MARK: - When user tap (i) button use editingMode
    func edit(_ toDoItem : ToDoItem){
        self.toDoItem = toDoItem
        isEditingMode = true
        nameTextField.text = toDoItem.name
        descriptionField.text = toDoItem.toDoDescription
    }
    
    @objc func saveNewToDoItem(_ sender: UIBarButtonItem) {
        if isEditingMode{
            self.delegate?.editsave(toDoItem: ToDoItem(name: nameTextField.text!, toDoDescription: descriptionField.text!, isDone: toDoItem!.isDone))
        }else{
            self.delegate?.save(toDoItem: ToDoItem(name: nameTextField.text!, toDoDescription: descriptionField.text!, isDone: false))
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - nameTextField must have text otherwise disable save button
    @objc func nameTextFieldTextEditing(_ sender: UITextField) {
        navigationItem.rightBarButtonItem?.isEnabled = !(sender.text?.isEmpty ?? false)
    }
}
