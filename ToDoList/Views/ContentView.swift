//
//  ContentView.swift
//  ToDoList
//
//  Created by Ben Wheeler on 6/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modalType: ModalType? = nil

    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos) { toDo in
                    Button {
                        modalType = .update(toDo)
                    } label: {
                        HStack{
                            if(toDo.completed){
                                Image(systemName: "checkmark.circle.fill")
                            } else {
                                Image(systemName: "circle")
                            }
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed) 
                            .foregroundColor(toDo.completed ? .gray : Color(.label))
                    }
                    }
            }
                .onDelete(perform: dataStore.deleteToDo)
        }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modalType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .navigationTitle("To Do List")
        }
        .sheet(item: $modalType) { $0 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
