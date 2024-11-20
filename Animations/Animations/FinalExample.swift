//
//  FinalExample.swift
//  Animations
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct FinalExample: View {
    @State private var isExpanded = false
    
    @State private var rotation = 0.0
    
    @State private var color = Color.red
    
    var body: some View {
        VStack {
            Circle().fill(color).frame(width: isExpanded ? 200:100, height: isExpanded ? 200:100).rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 0.5), value: isExpanded ).onTapGesture {
                    withAnimation(.spring()) {
                        rotation += 45
                        color = color == .red ? .blue : .red
                    }
                }
            Button ("Toogle size") {
                isExpanded.toggle()
            }
        }
        
    }
}

#Preview {
    FinalExample()
}
