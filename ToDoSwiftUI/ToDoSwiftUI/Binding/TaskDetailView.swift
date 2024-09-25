//
//  TaskDetailView.swift
//  ToDoSwiftUI
//
//  Created by Alumno on 18/09/24.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var tasks: [String]
    @State private var task = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            TextField("New task", text: $task).padding().textFieldStyle(.roundedBorder)
            Button(action: {
                if !task.isEmpty {
                    tasks.append(task)
                    task = ""
                    dismiss()
                }
            }, label: {
                Text("Add")
            })
        }.navigationTitle("New task")
        
    }
}

#Preview {
    TaskDetailView(tasks: .constant([]))
}
