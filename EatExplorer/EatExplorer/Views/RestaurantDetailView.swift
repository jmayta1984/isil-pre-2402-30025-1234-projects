//
//  RestaurantDetailView.swift
//  EatExplorer
//
//  Created by Alumno on 27/11/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(
                    url: URL(string: restaurant.poster),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    },
                    placeholder: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25).fill(Color.gray.opacity(0.2))                        .frame(width: .infinity, height: 400)
                            ProgressView()
                            
                            
                        }
                    }
                    
                )
                Text(restaurant.title).bold().font(.title).foregroundStyle(Color.orange)
                Text(restaurant.description).font(.subheadline)
                GoogleMapView(latitude: restaurant.latitude, longitude: restaurant.longitude, zoom: 15)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        
    }
}
