//
//  RestaurantDAO.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import CoreData

class RestaurantDAO {
    let context = PersistenceController.shared.container.viewContext
    
    func insert(restaurant: Restaurant){
        
        let entity = RestaurantEntity(context: context)
        entity.title = restaurant.title
        entity.detail = restaurant.description
        entity.poster = restaurant.poster
        saveContext()
        print("Se registró")
    }
    
    func delete(restaurant: Restaurant) {
        let fetchRequest = RestaurantEntity.fetchAllRestaurantRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@ ", restaurant.title)
        
        do {
            let restaurants = try context.fetch(fetchRequest)
            
            for item in restaurants {
                context.delete(item)
            }
            saveContext()

        } catch let error {
            print("Error: \(error)")
        }
        
        
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
               try context.save()
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
    
}
