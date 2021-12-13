//
//  ContentView.swift
//  ToDo
//
//  Created by Ben Wheeler on 13/12/21.
//

import SwiftUI

struct TaskItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let due: Date
    let hasTime: Bool
}

class ToDos: ObservableObject {
    @Published var items = [TaskItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([TaskItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @StateObject var todos = ToDos()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(todos.items, id: \.name) { task in
                    HStack{
                        Image(systemName: "circle")
                            .foregroundColor(Color(.systemMint))
                        Text(task.name)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "calendar")
                        if(task.hasTime){
                            Text(task.due.formatted())
                        }
                        else{
                            Text(task.due, format: .dateTime.day().month().year())
                        }
                    }
                    .foregroundColor(Date.now > task.due ? .red : .primary)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("To-Do List")
                        .toolbar {
                            ToolbarItemGroup(placement: .cancellationAction){
                                EditButton()
                            }
                            ToolbarItemGroup(placement: .confirmationAction){
                                Button {
                                    showingSheet.toggle()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                }
                            }
                        }
            
            .sheet(isPresented: $showingSheet) {
                NewView(todos: todos)
            }
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        todos.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
