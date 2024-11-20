//
//  ExplicitAnimation.swift
//  Animations
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct ExplicitAnimation: View {
    
    @State private var angle = 0.0
        
    var body: some View {
        VStack {
            Rectangle().fill(Color.green)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100).rotationEffect(.degrees(angle))
            Button ("Rotate") {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.5)){
                    angle += 45
                }
            }.padding()
        }
        
        
    }
}

#Preview {
    ExplicitAnimation()
}
