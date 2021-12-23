//
//  TaskDetails.swift
//  ToDo
//
//  Created by Ben Wheeler on 23/12/21.
//

import SwiftUI

struct TaskDetails: View {
    let task : TaskItem

    init(task: TaskItem){
        self.task = task
    }
    
    var body: some View {
        List{
            HStack{
                Text("Due")
                Spacer()
                if(task.hasTime){
                    Text(task.due.formatted())
                }
                else{
                    Text(task.due, format: .dateTime.day().month().year())
                }
            }
        }
        .navigationTitle(task.name)
    }
}

struct TaskDetails_Previews: PreviewProvider {

    static let test = TaskItem(name: "J", due: Date.now, hasTime: false, completed: false)
    static var previews: some View {
        TaskDetails(task: test)
    }
}
