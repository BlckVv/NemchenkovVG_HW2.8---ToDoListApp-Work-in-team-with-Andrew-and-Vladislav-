//
//  ToDoListStartingTableViewController.swift
//  ToDoListApp
//
//  Created by Владимир Немченков on 30.07.2021.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDoItems = ToDoListData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.toDoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let toDoItem = toDoItems.toDoArray[indexPath.row]
        
        content.text = toDoItem.title
        
        if toDoItem.status == .completed {
            cell.contentView.backgroundColor = UIColor.systemRed
        }
        
        return cell
    }
    
    // MARK: - Удаление ячейки
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDoItems.toDoArray.remove(at: indexPath.row)
        }
    }
    
    // MARK: - Перемещение ячейки
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
