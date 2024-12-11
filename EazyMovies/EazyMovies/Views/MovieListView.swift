//
//  MovieListView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.movies) { movie in
                
                MovieListItemView(movie: movie)
                
            }
            .listRowSeparator(.hidden)
            
        }
        .listStyle(PlainListStyle())
        .onAppear{
            viewModel.getMovies()
        }
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel())
}
