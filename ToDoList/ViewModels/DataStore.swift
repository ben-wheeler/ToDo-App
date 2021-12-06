//
//  DataStore.swift
//  ToDoList
//
//  Created by Ben Wheeler on 6/12/21.
//

import Foundation

class DataStore: ObservableObject {
    @Published var toDos:[ToDo] = []
    
    init() {
        loadToDo()
    }
    
    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
    }
    
    func updateToDo(_ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: {$0.id == toDo.id}) else { return }
        toDos[index] = toDo
    }
    
    func deleteToDo(at indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func loadToDo() {
        toDos = ToDo.sampleData
    }
    
    func saveToDos() {
        print("Saving toDos to fyle system eventually")
    }
}
