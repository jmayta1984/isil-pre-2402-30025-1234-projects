//
//  FavoriteListViewModel.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites: [Favorite] = []
    let restaurantDao = RestaurantDAO()
    
    func getFavorites() {
        let favorites = restaurantDao.fetchAll().map { entity in
            Favorite(id: Int(entity.idRestaurant), title: entity.title, description: entity.detail, poster: entity.poster)
        }
        self.favorites = favorites
    }
}
