//
//  RestauranteEntity.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import CoreData

class RestaurantEntity: NSManagedObject {
    @NSManaged var idRestaurant: Int16
    @NSManaged var title: String
    @NSManaged var detail: String
    @NSManaged var poster: String
    
    static func fetchAllRestaurantRequest() -> NSFetchRequest<RestaurantEntity> {
        return NSFetchRequest(entityName: "RestaurantEntity")
    }
    
}
