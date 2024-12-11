//
//  ContentView.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [:]
    }
    
    let categories = ["Popular", "Upcoming", "Top rated"]
    @State var selectedCategory = "Popular"
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .foregroundStyle( selectedCategory == category ? Color.orange : Color.gray )
                                .onTapGesture {
                                selectedCategory = category
                            }
                        }
                    }
                    
                }
                MovieListView()
                Spacer()
            }
            .padding()
            .navigationTitle("EazyMovies")
            
        }
    }
}

#Preview {
    ContentView()
}
