//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ben Wheeler on 6/12/21.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
