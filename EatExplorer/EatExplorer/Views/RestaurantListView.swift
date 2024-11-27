//
//  RestaurantListView.swift
//  EatExplorer
//
//  Created by Alumno on 27/11/24.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantListViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.message.isEmpty {
                    Text(viewModel.message)
                    
                }
                List {
                    ForEach(viewModel.restaurants) { restaurant in
                        NavigationLink(destination: {
                            RestaurantDetailView(restaurant: restaurant)
                        }) {
                            RestaurantListItem(restaurant: restaurant)

                        }
                    }
                }.listStyle(PlainListStyle())
            }.navigationTitle("Restaurants")
        }
       .onAppear{
            viewModel.getRestaurants()
        }
    }
}

#Preview {
    RestaurantListView().preferredColorScheme(.dark)
}
