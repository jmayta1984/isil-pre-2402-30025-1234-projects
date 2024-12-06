//
//  RestauranteEntity.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import CoreData

class RestauranteEntity: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var detail: String
    @NSManaged var poster: String
    
    static func fetchAllRestaurantRequest() -> NSFetchRequest<RestauranteEntity> {
        return NSFetchRequest(entityName: "RestaurantEntity")
    }
    
}
