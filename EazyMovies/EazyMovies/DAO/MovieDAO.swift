//
//  MovieDAO.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation
import CoreData

class MovieDAO {
    
    let context = PersistenceController.shared.container.viewContext
    
    func insert(movie: Movie) {
        let favorite = FavoriteMovie(context: context)
        
        favorite.id = Int32(movie.id)
        favorite.overview = movie.overview
        favorite.title = movie.title
        
        saveContext()
    }
    
    func delete(by id: Int) {
        let request = NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
        request.predicate = NSPredicate(format: "id == %i", id)
        
        do {
            let favorites = try context.fetch(request)
            for favorite in favorites {
                context.delete(favorite)
            }
            saveContext()
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchAll() -> [FavoriteMovie]{
        let request = NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
        do {
            return try context.fetch(request)
            
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
        return []
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
