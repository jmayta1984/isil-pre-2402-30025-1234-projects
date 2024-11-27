//
//  RestaurantListViewModel.swift
//  EatExplorer
//
//  Created by Alumno on 27/11/24.
//

import Foundation

class RestaurantListViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var message: String = ""
    
    func getRestaurants() {
        RestaurantService().getRestaurants { restaurants, message in
            DispatchQueue.main.async {
                if let restaurants = restaurants {
                    self.restaurants = restaurants
                }
                
                if let message = message {
                    self.message = message
                }
            }
            
        }
    }
}
