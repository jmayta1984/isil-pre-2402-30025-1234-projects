//
//  MovieService.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class MovieService {
    
    func getMovies(completion: @escaping ([Movie]?, String?) -> Void ) {
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=3cae426b920b29ed2fb1c0749f258325"
        HttpRequestHelper().GET(url: url) { success, data, message in
            if success {
                guard let data = data else {
                    completion(nil, "Error: \(message ?? "No data")")
                    print("Error: \(message ?? "No data")")
                    return
                }
                do {
                    let wrapper = try JSONDecoder().decode(MovieWrapper.self, from: data)
                    let moviesReponse = wrapper.results
                    let movies = moviesReponse.map { response in
                        response.toMovie()
                    }
                    completion(movies, nil)
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            } else {
                completion(nil, "Error: \(message ?? "No response")")
                print("Error: \(message ?? "No response")")
            }
        }
    }
    
}
