//
//  ContentView.swift
//  EatExplorer
//
//  Created by Alumno on 27/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            RestaurantListView()
                .tabItem {
                    Label("Restaurants", systemImage: "list.dash")
                }
            FavoriteListView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    HomeView()
}
