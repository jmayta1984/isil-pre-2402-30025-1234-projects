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
                HStack {
                    
                    AsyncImage(
                        url: URL(string: character.image),
                        content: { image in
                            image.resizable()
                                .frame(width: 96,height: 96).cornerRadius(20)
                        },
                        placeholder: {
                            ProgressView().frame(width: 96, height: 96)
                        }
                        
                    )
                    
                    Text(character.name)
                    
                }
            }
        }.listStyle(PlainListStyle())
            .onAppear {
                CharacterService().getAllCharacters { characters, message in
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
