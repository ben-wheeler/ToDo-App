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
                .onSubmit {
                    let answer = newTODO.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    guard answer.count > 0 else { return }
                                        
                    toDos.insert(answer, at: 0)
                    newTODO = ""
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
