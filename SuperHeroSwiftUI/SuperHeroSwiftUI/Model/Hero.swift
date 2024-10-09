//
//  Hero.swift
//  SuperHeroSwiftUI
//
//  Created by Alumno on 9/10/24.
//

import Foundation

typealias Heroes = [Hero]

struct Hero: Decodable {
    let id: String
    let name: String
    let biography: Biography
    let image: HeroImage
}

struct Biography: Decodable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
    }
}

struct HeroImage: Decodable {
    let url: String
}

struct HerosWrapper: Decodable {
    let heroes: Heroes
    
    enum CodingKeys: String, CodingKey {
        case heroes = "results"
    }
}
