//
//  PersistenceController.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EatExplorerModel")
        
        if inMemory  {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data Stores: \(error)")
            }
        }
    }
}
