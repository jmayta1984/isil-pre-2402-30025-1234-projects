//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Alumno on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    
    var tasks = ["Ir a ISIL", "Estudiar", "Repasar"]
    
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
                        TaskDetailView()
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
