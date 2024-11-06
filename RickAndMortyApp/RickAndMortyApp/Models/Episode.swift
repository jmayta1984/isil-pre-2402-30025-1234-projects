//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import Foundation

struct Episode: Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let description: String
    let characters: [Character]
}
