//
//  ViewController.swift
//  Todoey
//
//  Created by Nariman Rajabi on 1/18/19.
//  Copyright © 2019 Nariman Rajabi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    //TODO: Setup UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
        
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - Tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDoey Item", message: "", preferredStyle: .alert)
        
        //Alert button text
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //What will happen when user clicks the Add Item button on our UIAlert
            
            //TODO: Add the new item to itemArray
            self.itemArray.append(textField.text!)
            
            //TODO: Save the newly added item to UserDefaults (key is for identifying)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            //TODO: reload tableView to view the newly added item
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

