//
//  MovieResponse.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

struct MovieWrapper: Decodable {
    let results: [MovieResponse]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String
    let poster: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case overview
    }
}
