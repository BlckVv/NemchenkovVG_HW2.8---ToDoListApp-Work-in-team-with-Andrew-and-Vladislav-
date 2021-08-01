//
//  EditToDoViewController.swift
//  ToDoListApp
//
//  Created by Andrii Oliievskyi on 2021-07-31.
//

import UIKit

protocol myInformationToDoDelegete{
    func deleteItem(index: Int)
    func changeStatusItem(index: Int)
}

class InformationToDo: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var toDoItem: ToDoItem?
    
    var index: Int?
    var delegate: myInformationToDoDelegete?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLable.text = toDoItem?.title
        descriptionLabel.text = toDoItem?.description
        completeButton.layer.cornerRadius = 10
        deleteButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func completeButtonPressed() {
        guard let index = index else {return}
        delegate?.changeStatusItem(index: index)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonPressed() {
        guard let index = index else {return}
        delegate?.deleteItem(index: index)
        navigationController?.popViewController(animated: true)
    }
    
}
