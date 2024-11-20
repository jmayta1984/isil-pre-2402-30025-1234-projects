//
//  ContentView.swift
//  Animations
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            Rectangle().fill(isExpanded ? Color.blue : Color.red)
                .frame(width: isExpanded ? 200 : 100, height: isExpanded ? 200 : 100 ).cornerRadius(isExpanded ? 50 : 0)
                .animation(.easeIn(duration: 0.5), value: isExpanded)
            Button("Toogle") {
                isExpanded.toggle()
            }.padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
