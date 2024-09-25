//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Alumno on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tasks = ["Ir a ISIL", "Estudiar", "Repasar"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task )
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: {
                        TaskDetailView(tasks: $tasks)
                    } ) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
