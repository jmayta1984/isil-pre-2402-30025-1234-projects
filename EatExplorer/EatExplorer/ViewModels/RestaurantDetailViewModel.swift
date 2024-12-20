//
//  RestaurantDetailViewModel.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import Foundation

class RestaurantDetailViewModel: ObservableObject {
    
    @Published var isFavorite: Bool = false
    let restaurantDAO =  RestaurantDAO()
    
    func chechFavorite(restaurant: Restaurant) {
        self.isFavorite = restaurantDAO.isFavorite(restaurant: restaurant)
    }
    
    func save(restaurant: Restaurant) {
        isFavorite ?
        restaurantDAO.insert(restaurant: restaurant) :
        restaurantDAO.delete(restaurant: restaurant)
        
    }
}
