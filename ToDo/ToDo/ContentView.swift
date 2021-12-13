//
//  ContentView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI

struct TaskItem {
    let name: String
    let due: String
}

class ToDos: ObservableObject {
    @Published var items = [TaskItem]()
}

struct ContentView: View {
    @StateObject var todos = ToDos()
    
    @State private var newTODO = ""
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(todos.items, id: \.name) { task in
                    HStack{
                        Image(systemName: "circle")
                            .foregroundColor(Color(.systemMint))
                        Text(task.name)
                        Image(systemName: "calendar")
                        Text(task.due)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                HStack{
                EditButton()
                    Spacer()
                Button {
                    let t = TaskItem(name: "Test", due: "23/07/2021")
                    todos.items.append(t)
//                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showingSheet) {
//                NewSheet(currentToDos: todos)
            }
            }
            
        }
    }
    func removeItems(at offsets: IndexSet) {
        todos.items.remove(atOffsets: offsets)
    }
}

struct NewSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var currentToDos: [String]
    @State private var newTODO = ""
    
    @State private var errorMessage = ""
    @State private var errorTitle = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    TextField("New To-Do Name", text: $newTODO)
                }
                
                .navigationTitle("New To-Do")
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.gray))
                    }
                }
                .onSubmit (addTODO)
                .alert(errorTitle, isPresented: $showError) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(errorMessage)
                }
                
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
                currentToDos.insert(task, at: 0)
            }
            newTODO = ""
        }
        
        func isNew(word: String) -> Bool {
            !currentToDos.contains(word)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
