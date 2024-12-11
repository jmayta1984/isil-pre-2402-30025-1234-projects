//
//  MovieListItemView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct MovieListItemView: View {
    
    @State var isFavorite:Bool = false
    let movie: Movie
    
    @StateObject var viewModel = MovieListItemViewModel()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
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
                    .lineLimit(1)
                Spacer()

            }
            Button(action: {
                isFavorite.toggle()
                isFavorite ? viewModel.insertFavorite(movie: movie) : viewModel.removeFavorite(movie: movie)
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color.orange)
            }.buttonStyle(BorderlessButtonStyle())
        }
        
        
    }
}

