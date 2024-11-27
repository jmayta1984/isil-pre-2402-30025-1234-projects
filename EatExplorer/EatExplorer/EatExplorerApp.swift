//
//  EatExplorerApp.swift
//  EatExplorer
//
//  Created by Alumno on 27/11/24.
//

import SwiftUI

@main
struct EatExplorerApp: App {
    let googleMapManager = GoogleMapManager()
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
}
