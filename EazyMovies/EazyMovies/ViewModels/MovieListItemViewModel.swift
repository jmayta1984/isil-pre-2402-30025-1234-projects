//
//  MovieListItemViewModel.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class MovieListItemViewModel: ObservableObject {
    let movieDao = MovieDAO()
    
    func insertFavorite(movie: Movie) {
        movieDao.insert(movie: movie)
    }
    
    func removeFavorite(movie: Movie) {
        movieDao.delete(by: movie.id)
    }
    
}
