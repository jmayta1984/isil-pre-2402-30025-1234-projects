//
//  TransitionExample.swift
//  Animations
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct TransitionExample: View {
    
    @State private var showRectangle = false
    var body: some View {
        VStack {
            if showRectangle {
                Rectangle().fill(Color.purple).frame(width: 200, height: 100).transition(.scale)
            }
            Button("Toogle") {
                withAnimation{
                    showRectangle.toggle()
                }
            }.padding()
        }
    }
}

#Preview {
    TransitionExample()
}
