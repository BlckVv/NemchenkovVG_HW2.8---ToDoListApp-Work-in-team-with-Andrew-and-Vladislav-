//
//  ToDoListData.swift
//  ToDoListApp
//
//  Created by Vladislav Kulak on 30.07.2021.
//

class ToDoListData {
    static var shared = ToDoListData()
    
    var toDoArray: [ToDoItem] = []
    
    private init(){}
}
