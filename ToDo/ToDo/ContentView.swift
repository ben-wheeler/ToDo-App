//
//  ContentView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var toDos = [String]()
    @State private var newTODO = ""
    
    @State private var errorMessage = ""
    @State private var errorTitle = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    TextField("New To-Do", text: $newTODO)
                }
                Section {
                    ForEach(toDos, id: \.self) { task in
                        Text(task)
                    }
                }
            }
            .navigationTitle("ToDos")
            .onSubmit (addTODO)
            .alert(errorTitle, isPresented: $showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            
        }
    }
    
    
    func addTODO() {
        let task = newTODO.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard task.count > 0 else { return }
        guard isNew(word: task) else {
            errorTitle = "Task already exists"
            errorMessage = "'\(task)' already exists within To-Do List, sorry! Please enter a task with a different name"
            showError = true
            return
        }
        
        withAnimation {
        toDos.insert(task, at: 0)
        }
        newTODO = ""
    }
    
    func isNew(word: String) -> Bool {
        !toDos.contains(word)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
