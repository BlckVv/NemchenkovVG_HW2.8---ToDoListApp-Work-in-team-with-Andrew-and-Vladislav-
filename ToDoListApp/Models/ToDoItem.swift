//
//  ToDoItem.swift
//  ToDoListApp
//
//  Created by Vladislav Kulak on 30.07.2021.
//


struct ToDoItem {
    let title: String
    let description: String
    var status: Status
}

enum Status {
    case active
    case completed
}
