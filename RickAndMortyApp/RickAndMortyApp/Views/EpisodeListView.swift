//
//  EpisodeListView.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import SwiftUI

struct EpisodeListView: View {
    
    @State var episodes:[Episode] = []
    var body: some View {
        NavigationStack {
            List {
                ForEach(episodes) { episode in
                    NavigationLink(destination: {
                        ForEach(episode.characters) { character in
                            Text(character.name)
                        }
                    }){
                        Text(episode.name)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        
        .onAppear {
            EpisodeService().getAllEpisodes { episodes, message in
                guard let episodes = episodes else { return }
                self.episodes = episodes
            }
        }
    }
}

#Preview {
    EpisodeListView()
}
