//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import SwiftUI

struct CharacterListView: View {
    @State var characters: [Character] = []
    
    var body: some View {
        List {
            ForEach(characters) { character in
                Text(character.name)
            }
        }.listStyle(PlainListStyle())
        .onAppear {
            CharactersService().getAllCharacters { characters, message in
                guard let characters = characters else {
                    return
                }
                self.characters = characters
            }
        }
    }
}

#Preview {
    CharacterListView()
}
