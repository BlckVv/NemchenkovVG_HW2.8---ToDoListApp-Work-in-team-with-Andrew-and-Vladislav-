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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItems.toDoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let toDoItem = toDoItems.toDoArray[indexPath.row]
        
        content.text = toDoItem.title
        
        cell.contentConfiguration = content
        
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
            tableView.reloadData()
        }
    }
    
    // MARK: - Перемещение ячейки
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        toDoItems.toDoArray[sourceIndexPath.row] = toDoItems.toDoArray[destinationIndexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - Навигация
    
    //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = UIStoryboard(name: "InformationToDo", bundle: nil).instantiateViewController(identifier: "InformationToDo") as! InformationToDo
        VC.toDoItem = toDoItems.toDoArray[indexPath.row]
        VC.index = indexPath.row
        VC.delegate = self
        navigationController?.pushViewController(VC, animated: true)
    }
    
}

// MARK: - Folloved protocols

extension ToDoListTableViewController: myInformationToDoDelegete {
    
    func deleteItem(index: Int) {
        toDoItems.toDoArray.remove(at: index)
        tableView.reloadData()
    }
    
    func changeStatusItem(index: Int) {
        toDoItems.toDoArray[index].status = .completed
        tableView.reloadData()
    }
}

