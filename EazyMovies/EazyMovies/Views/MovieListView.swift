//
//  MovieListView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.movies) { movie in
                HStack {
                    AsyncImage(
                        url: URL(string: movie.poster),
                        content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 90, height: 135)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: 90, height: 135)
                        }
                        
                    )
                    Text(movie.title)
                    
                }
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
    MovieListView()
}
