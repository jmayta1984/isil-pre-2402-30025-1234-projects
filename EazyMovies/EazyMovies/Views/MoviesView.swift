//
//  ContentView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct MoviesView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    let categories = ["Popular", "Upcoming", "Top rated", "Now playing"]
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .foregroundStyle( viewModel.selectedCategory == category ? Color.orange : Color.gray )
                                .onTapGesture {
                                    viewModel.updateCategory(category: category)
                            }
                        }
                    }
                    
                }
                MovieListView(viewModel: viewModel)
                Spacer()
            }
            .padding()
            .navigationTitle("EazyMovies")
            
        }
    }
}

#Preview {
    MoviesView()
}
