//
//  ContentView.swift
//  ToDo
//
//  Created by Ben Wheeler on 23/11/21.
//



import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome")
                NavigationLink(destination: ToDoListView()) {
                    Text("View To-Dos")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
