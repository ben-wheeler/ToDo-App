//
//  SwiftUIView.swift
//  ToDo
//
//  Created by Ben Wheeler on 24/11/21.
//

import SwiftUI

struct ToDoListView: View {
    struct toDo: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    private var completeToDoList = [
        toDo(name: "Shopping"),
        toDo(name: "Work"),
        toDo(name: "Mow Lawn"),
        toDo(name: "Go to Melbourne")
    ]
    @State private var multiSelection = Set<UUID>()

    var body: some View {
//
            List(completeToDoList, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("To-Do List")
            .toolbar { EditButton() }
        }
//        Text("\(multiSelection.count) selections")
    }
//}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
