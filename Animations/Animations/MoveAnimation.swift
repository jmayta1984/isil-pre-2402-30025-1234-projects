//
//  MoveAnimation.swift
//  Animations
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct MoveAnimation: View {
    
    @State private var offset: CGFloat = 0
    var body: some View {
        VStack {
            Circle().fill(Color.orange).frame(width: 100, height: 100).offset(x: offset).animation(.easeInOut(duration: 4), value: offset)
            Button("Move") {
                offset = offset == 0 ? 200 : -200
            }.padding()
        }
    }
}

#Preview {
    MoveAnimation()
}
