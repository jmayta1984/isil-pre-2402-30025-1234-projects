//
//  ContactDao.swift
//  Agenda
//
//  Created by user272495 on 11/13/24.
//

import CoreData

struct ContactDao {
    private var context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    func add(name: String, company: String, phone: String) {
        let contact = Contact(context: context)
        contact.name = name
        contact.company = company
        contact.phone = phone
        saveContext()
    }
    
    func delete(contact: Contact) {
        context.delete(contact)
        saveContext()
    }
    
    func update() {
        saveContext()
    }
    
    func fetchAll() -> [Contact]{
        let request = Contact.fetchAllRequest()
        do {
            let contacts = try context.fetch(request)
            return contacts
        } catch (let error) {
            print(error)
        }
        return [];
        
    }
    
    func saveContext() {
        
        if (context.hasChanges) {
            do {
                try context.save()
            } catch (let error) {
                print(error)
            }
        }
        
    }
}
