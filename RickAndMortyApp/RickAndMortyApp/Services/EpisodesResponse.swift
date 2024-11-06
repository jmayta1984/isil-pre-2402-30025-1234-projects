//
//  EpisodesResponse.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import Foundation

struct EpisodesResponse: Decodable {
    let results: [EpisodeDto]
}

struct EpisodeDto: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
    }
}
