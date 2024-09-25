//
//  TaskListView.swift
//  ToDoSwiftUI
//
//  Created by Alumno on 25/09/24.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var viewModel: TaskListViewModel
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.tasks, id:\.self) { task in
                        Text(task)
                    }
                }
            }.navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: {
                            TaskView(viewModel: viewModel)
                        } ) {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
    }
}

#Preview {
    TaskListView(viewModel: TaskListViewModel())
}

