//
//  ViewController.swift
//  Todoey Practice
//
//  Created by VIRGIE LYN JORDAN on 11/3/19.
//  Copyright © 2019 VIRGIE LYN JORDAN. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Go to Niagara", "Take lots of pictures", "Visit downtown Toronto"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - TableVIew Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
       {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {

            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {

            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
//        tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? .none : .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func AddBtnPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) in
            
            
        }
        
        alert.addTextField { (textField) in
            
           // let newItem = textField.text
            
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

