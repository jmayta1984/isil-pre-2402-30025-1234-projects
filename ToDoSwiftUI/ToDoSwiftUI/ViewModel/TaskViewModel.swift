//
//  TaskViewModel.swift
//  ToDoSwiftUI
//
//  Created by Alumno on 25/09/24.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [String] = []
    
    func addTask(task: String) {
        tasks.append(task
        )
    }
}
