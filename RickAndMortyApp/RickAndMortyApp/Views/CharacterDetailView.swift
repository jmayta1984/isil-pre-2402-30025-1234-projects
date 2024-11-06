//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var body: some View {
        VStack (alignment: .leading) {
            AsyncImage(
                url: URL(string: character.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity,
                               maxHeight: 400)
                        
                },
                placeholder: {
                    ProgressView().frame(width: .infinity, height: 400)
                }
                
            )
            
            Text(character.name).bold().font(.title).padding([.top, .leading, .trailing])
            Text(character.species).padding([.leading,.trailing])
            Text(character.status).padding([.leading,.trailing])
            Spacer()
        }.ignoresSafeArea()
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 1, name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human", status: "Alive"))
}
