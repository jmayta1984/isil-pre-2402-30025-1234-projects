//
//  CharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

struct CharactersResponse: Decodable {
    
    let results: [CharacterDto]
}

struct CharacterDto: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginDto
    let location: LocationDto
    let image: String
    let episode: [String]
    
    func toCharacter() -> Character {
        Character(id: id, name: name, image: image, species: species, status: status)
    }
    
}

struct OriginDto: Decodable {
    let name: String
    let url: String
}

struct LocationDto: Decodable {
    let name: String
    let url: String
}
