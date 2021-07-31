//
//  CreateToDoViewController.swift
//  ToDoListApp
//
//  Created by Vladislav Kulak on 31.07.2021.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    var toDoItems: ToDoListData!
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTV: UITextView!
    
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTF.delegate = self
        
        addTaskButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        
        descriptionTV.layer.cornerRadius = 5
        descriptionTV.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        descriptionTV.layer.borderWidth = 0.5
        descriptionTV.clipsToBounds = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func addBtnPressed() {
        if titleTF.text == "" {
            showAlert(title: "Wrong data", message: "Title field can't be empty!")
            return
        }
        
        if let title = titleTF.text  {
            ToDoListData.shared.toDoArray.append(ToDoItem(title: title, description: descriptionTV.text, status: .active))
        }
        
        dismiss(animated: true)
        
    }
    
    @IBAction func cancelBtnPressed() {
        dismiss(animated: true)
    }
    
}



extension CreateToDoViewController: UITextFieldDelegate {
    // MARK: - Modal alert
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - TF Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descriptionTV.becomeFirstResponder()
    }
}
