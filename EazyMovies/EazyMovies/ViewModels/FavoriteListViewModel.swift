//
//  FavoriteListViewModel.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites:[FavoriteMovie] = []
    
    let movieDAO = MovieDAO()
    
    func getFavorites(){
        favorites = movieDAO.fetchAll()
    }
    
    func removeFavorite(indexSet: IndexSet) {
        guard let index = indexSet.first else {
            return
        }
        movieDAO.delete(by: Int(favorites[index].id))
        
    }
    
}
