//
//  FavoriteListView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct FavoriteListView: View {
    
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.favorites, id: \.self) { favorite in
                VStack {
                    Text(favorite.title ?? "")
                    Text(favorite.overview ?? "")
                }
                
            }.onDelete(perform: { indexSet in
                viewModel.removeFavorite(indexSet: indexSet)
            })
        }
        .onAppear {
            viewModel.getFavorites()
        }
    }
}

#Preview {
    FavoriteListView()
}
