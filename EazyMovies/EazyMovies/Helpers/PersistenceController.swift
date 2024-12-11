//
//  PersistenceController.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EazyMoviesModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description , error in
            if let error = error {
                fatalError("Error loading Core Data Stores: \(error)")
            }
        }
    }
}
