//
//  NewView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI

struct NewView: View {
    
    @ObservedObject var todos: ToDos
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var due = Date.now
    @State private var hasTime = false
    
    @State private var errorMessage = ""
    @State private var errorTitle = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Name", text: $name)
                    DatePicker("Due Date", selection: $due, in: Date.now..., displayedComponents: .date)
                    Toggle("Time", isOn: $hasTime)
                    if(hasTime){
                        DatePicker("Due Date", selection: $due, in: Date.now..., displayedComponents: .hourAndMinute)
                    }
                }
            }
            .navigationTitle("Create a new To-Do")
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.gray))
                    }
                }
                ToolbarItemGroup(placement: .confirmationAction){
                    Button("Save") {
                        let item = TaskItem(name: name, due: due, hasTime: hasTime, completed: false)
                        todos.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView(todos: ToDos())
    }
}
