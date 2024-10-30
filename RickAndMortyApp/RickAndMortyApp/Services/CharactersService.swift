//
//  CharactersService.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

class CharactersService {
    
    func getAllCharacters() {
        let url = "https://rickandmortyapi.com/api/character"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            
        }
    }
}
