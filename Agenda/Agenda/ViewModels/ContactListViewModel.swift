//
//  ContactListViewModel.swift
//  Agenda
//
//  Created by user272495 on 11/13/24.
//

import Foundation

class ContactListViewModel: ObservableObject {
    
    @Published var contacts:[Contact] = []
    private let contactDao = ContactDao()
    
    init() {
        fetchAllContacts()
    }
    
    func addContact(name: String, company: String, phone: String) {
        contactDao.add(name: name, company: company, phone: phone)
        fetchAllContacts()
        
    }
    
    private func fetchAllContacts() {
        contacts = contactDao.fetchAll()

    }
}
