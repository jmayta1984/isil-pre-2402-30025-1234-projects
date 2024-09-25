//
//  TaskView.swift
//  ToDoSwiftUI
//
//  Created by Alumno on 25/09/24.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var viewModel: TaskListViewModel
    @State private var task = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            TextField("Add new task", text: $task).padding().textFieldStyle(.roundedBorder)
            Button(action: {
                if !task.isEmpty {
                    viewModel.addTask(task: task)
                    task = ""
                    dismiss()
                }
            }) {
                Text("Add")
            }
        }
      
    }
}

#Preview {
    TaskView(viewModel: TaskListViewModel())
}
