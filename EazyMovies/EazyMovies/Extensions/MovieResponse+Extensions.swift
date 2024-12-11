//
//  MovieResponse+Extensions.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

extension MovieResponse {
    
    /// Returns a movie.
    func toMovie() -> Movie {
        return Movie(id: id, title: title, poster: "https://image.tmdb.org/t/p/w500\(poster)", overview: overview)
    }
}
