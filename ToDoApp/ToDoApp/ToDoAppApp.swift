//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Ben Wheeler on 6/12/21.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    
    let persistenceContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
