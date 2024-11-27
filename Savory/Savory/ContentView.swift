//
//  ContentView.swift
//  Savory
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GoogleMapView(latitude: -12.1254174, longitude: -77.0274166, zoom: 15)
        }
        .padding()
    }
}

#Preview {
    ContentView().onAppear{
        GoogleMapManager()
    }
}
