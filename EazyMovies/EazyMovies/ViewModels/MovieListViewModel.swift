//
//  MovieListViewModel.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var errorMessage = ""
    @Published var isLoading = false
    
    let service = MovieService()
    
    func getMovies() {
        
        isLoading = true
        
        service.getMovies { movies, message in
            
            DispatchQueue.main.async {
                if let movies = movies {
                    self.movies = movies
                }
                
                if let message = message {
                    self.errorMessage = message
                }
                self.isLoading = false
            }
            
        }
    }
    
}
