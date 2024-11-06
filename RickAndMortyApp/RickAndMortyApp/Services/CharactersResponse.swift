//
//  CharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

struct CharactersResponse: Decodable {
    
    let results: [Character]
}

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
}
