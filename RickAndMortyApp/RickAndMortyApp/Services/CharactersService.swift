//
//  CharactersService.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

class CharactersService {
    
    func getAllCharacters(completion: @escaping ([Character]?, String?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else { return }
                do {
                    let charactersResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    completion(charactersResponse.results, nil)
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            } else {
                completion(nil, "Error: \(message ?? "no response")")
            }
        }
    }
}
