//
//  ContentView.swift
//  DemoApp
//
//  Created by Alumno on 4/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    
    let names = ["Jorge", "Carlos", "Ana"]
    
    let courses = ["Aplicaciones móviles para iPhone", "Aplicaciones móviles para Android", "Desarrollo de aplicaciones móviles"]
    
    var body: some View {
        
        List {
            Section(header: Text("Contacts")) {
                ForEach(names, id: \.self) { name in
                    HStack {
                        Text(name)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Info")
                        })
                    }
                   
                }
            }
            Section(header: Text("Courses")) {
                ForEach(courses, id: \.self) { course in
                    Text(course)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
