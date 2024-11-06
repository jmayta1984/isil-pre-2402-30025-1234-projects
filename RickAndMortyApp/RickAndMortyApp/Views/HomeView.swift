//
//  HomeView.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            CharacterListView().tabItem {
                Text("Characters")
            }
            EpisodeListView().tabItem {
                Text("Episodes")
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
