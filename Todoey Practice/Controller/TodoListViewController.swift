//
//  ViewController.swift
//  Todoey Practice
//
//  Created by VIRGIE LYN JORDAN on 11/3/19.
//  Copyright © 2019 VIRGIE LYN JORDAN. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Buy Apples"
        newItem.done = true
        
        let newItem2 = Item()
        newItem2.title = "Buy Pears"
        newItem2.done = false
        
        itemArray.append(newItem)
        itemArray.append(newItem2)
        
        if let items = defaults.array(forKey: "ToDoList") as? [Item] {
            itemArray =  items
        }
        
        
    }

    // MARK: - TableVIew Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
 
        
//        if itemArray[indexPath.row].done == true {
//            cell.accessoryType = .checkmark
//
//        } else {
//            cell.accessoryType = .none
//        }
        
        print("Datasource called")
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
       {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
    
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func AddBtnPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
           // self.itemArray.append(textField.text!)
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoList")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            
            textField = alertTextField

        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

