//
//  Contact.swift
//  Agenda
//
//  Created by user272495 on 11/13/24.
//

import CoreData


class Contact: NSManagedObject, Identifiable {
    
    @NSManaged var name: String
    @NSManaged var company: String
    @NSManaged var phone: String
    
    static func fetchAllRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }
    
}
