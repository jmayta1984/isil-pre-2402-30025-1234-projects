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
        NavigationStack {
            List {
                ForEach(characters) { character in
                    NavigationLink(destination: { CharacterDetailView(character: character)}) {
                        HStack {
                            AsyncImage(
                                url: URL(string: character.image),
                                content: { image in
                                    image.resizable()
                                        .frame(width: 96,height: 96).clipShape(RoundedRectangle(cornerRadius: 20.0))
                                },
                                placeholder: {
                                    ProgressView().frame(width: 96, height: 96)
                                }
                                
                            )
                            
                            Text(character.name)
                        }
                    }
                    
                    
                }
            }.listStyle(PlainListStyle())
                .navigationBarBackButtonHidden()
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
}

#Preview {
    CharacterListView()
}
