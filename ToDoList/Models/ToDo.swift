//
//  ToDo.swift
//  ToDoList
//
//  Created by Ben Wheeler on 6/12/21.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [
        ToDo(name: "Get Groceries"),
        ToDo(name: "Please work", completed: true)
        ]
    }
}
