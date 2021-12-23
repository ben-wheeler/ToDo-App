//
//  TaskDetails.swift
//  ToDo
//
//  Created by Ben Wheeler on 23/12/21.
//

import SwiftUI

struct TaskDetails: View {
    let task : TaskItem
    let tDue : Double
    let tCreated : Double
    let now = Date.now.timeIntervalSince1970
    
    init(task: TaskItem){
        self.task = task
        self.tDue = task.due.timeIntervalSince1970
        self.tCreated = task.created.timeIntervalSince1970
        
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
            ProgressView("Time elapsed", value: now-tCreated >= tDue-tCreated ? tDue-tCreated : now-tCreated, total: tDue-tCreated)
        }
        .navigationTitle(task.name)
    }
}

struct TaskDetails_Previews: PreviewProvider {
    
    static let test = TaskItem(name: "J", due: Date.now, hasTime: false, completed: false, created: Date.now)
    static var previews: some View {
        TaskDetails(task: test)
    }
}
