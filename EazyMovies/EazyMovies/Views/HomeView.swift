//
//  HomeView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MoviesView().tabItem {
                Label("Movies", systemImage: "video.fill")
            }
            FavoriteListView().tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
        
    }
}

#Preview {
    HomeView()
}
