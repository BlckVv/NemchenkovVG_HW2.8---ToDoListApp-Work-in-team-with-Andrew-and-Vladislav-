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
        
        setBackground(status: toDoItems.toDoArray[indexPath.row].status, cell: cell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // MARK: - Перемещение ячейки
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedObject = toDoItems.toDoArray[sourceIndexPath.row]
        toDoItems.toDoArray.remove(at: sourceIndexPath.row)
        toDoItems.toDoArray.insert(movedObject, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    // MARK: - Навигация
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "InformationToDo", bundle: nil).instantiateViewController(identifier: "InformationToDo") as! InformationToDo
        vc.toDoItem = toDoItems.toDoArray[indexPath.row]
        vc.index = indexPath.row
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Folloved protocols

extension ToDoListTableViewController: myInformationToDoDelegete {
    
    func deleteItem(index: Int) {
        toDoItems.toDoArray.remove(at: index)
        tableView.reloadData()
    }
    
    func changeStatusItem(index: Int) {
       
        if toDoItems.toDoArray[index].status == .active {
            toDoItems.toDoArray[index].status = .completed
        } else {
            toDoItems.toDoArray[index].status = .active
        }
        
        tableView.reloadData()
    }
    
    private func setBackground(status: Status, cell: UITableViewCell){
        switch status {
        case .active:
            cell.contentView.backgroundColor = UIColor.white
        default:
            cell.contentView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        }
    }
}

