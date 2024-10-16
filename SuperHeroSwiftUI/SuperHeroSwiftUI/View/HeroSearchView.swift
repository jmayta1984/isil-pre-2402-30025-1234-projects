//
//  HeroSearchView.swift
//  SuperHeroSwiftUI
//
//  Created by Alumno on 16/10/24.
//

import SwiftUI

struct HeroSearchView: View {
    @State var heroes: Heroes = []
    @State var query: String = ""
    
    var body: some View {
        VStack {
            TextField("Search hero", text: $query).padding().textFieldStyle(.roundedBorder)
            Button(action: {
                HeroService().getHeroesByName(name: query) { heroes in
                    self.heroes = heroes
                }
            } ) {
                Text("Search")
            }.buttonStyle(.borderedProminent)
            List {
                ForEach(heroes) { hero in
                    VStack {
                        AsyncImage(url: URL(string: hero.image.url))
                        Text(hero.name)
                        Text(hero.biography.fullName)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HeroSearchView()
}
