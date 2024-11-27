//
//  RestaurantResponse.swift
//  EatExplorer
//
//  Created by Alumno on 27/11/24.
//

import Foundation

struct RestaurantResponse: Decodable {
    let id: Int
    let title: String
    let poster: String
    let latitude: Double
    let longitude: Double
    let rating: Double
    let description: String
    
    func toRestaurant() -> Restaurant {
        Restaurant(id: id, title: title, poster: poster, description: description, latitude: latitude, longitude: longitude)
    }
}
