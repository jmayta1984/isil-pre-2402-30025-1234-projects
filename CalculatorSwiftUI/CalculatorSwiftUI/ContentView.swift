//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Alumno on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var greeting: String = "Hi"
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Escribe tu nombre", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
                Button(action: {
                    greeting = "Hi \(name)"
                }, label: {
                    Text("Say Hi")
                }).buttonStyle(.borderedProminent)
                
                Text(greeting)
                
                NavigationLink(destination: {NextView()}, label: { Text("Next ")})
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
