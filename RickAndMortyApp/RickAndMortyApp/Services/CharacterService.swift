//
//  CharactersService.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

class CharacterService {
    
    func getAllCharacters(completion: @escaping ([Character]?, String?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else { return }
                do {
                    let charactersResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    let charactersDto = charactersResponse.results
                    let characters = charactersDto.map { characterDto in
                        characterDto.toCharacter()
                    }
                    completion(characters, nil)
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            } else {
                completion(nil, "Error: \(message ?? "no response")")
            }
        }
    }
    
    func getCharacterById(url: String, completion: @escaping( Character?, String?) -> Void ) {
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else { return }
                do {
                    let characterDto = try JSONDecoder().decode(CharacterDto.self, from: data)
                    let character = characterDto.toCharacter()
                    completion(character, nil)
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            } else {
                completion(nil, "Error: \(message ?? "no response")")
            }
        }
    }
}
