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
    @Published var selectedCategory = "Popular"
    
    let service = MovieService()
    
    func updateCategory(category: String) {
        self.selectedCategory = category
        getMovies()
    }
    
    func getMovies() {
        
        isLoading = true
        
        var endpoint: String
        
        switch selectedCategory {
        case "Popular":
            endpoint = "popular"
        case "Upcoming":
            endpoint = "upcoming"
        case "Now playing":
            endpoint = "now_playing"
        default:
            endpoint = "top_rated"
        }
        
        service.getMovies(endpoint: endpoint ) { movies, message in
            
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
