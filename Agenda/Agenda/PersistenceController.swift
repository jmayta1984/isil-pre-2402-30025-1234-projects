//
//  PersistenceController.swift
//  Agenda
//
//  Created by user272495 on 11/13/24.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "AgendaModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Cora Dota stores: \(error)")
            }
        }
        
    }
    
}
