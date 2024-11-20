//
//  ContactListView.swift
//  Agenda
//
//  Created by user272495 on 11/13/24.
//

import SwiftUI

struct ContactListView: View {
    @StateObject private var viewModel = ContactListViewModel()
    
    @State var name: String = ""
    @State var company: String = ""
    @State var phone: String = ""
    @State var isAdding: Bool = true
    @State var contact: Contact?
    
    var body: some View {
        
      
        VStack {
            
            Spacer()
            TextField("Name", text: $name).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            
            TextField("Company", text: $company).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            TextField("Phone", text: $phone).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            
            Button(action: {
                
                if (isAdding) {
                    self.viewModel.addContact(name: self.name, company: self.company, phone: self.phone)
                } else {
                    if let contact = contact {
                        contact.name = name
                        contact.company = company
                        contact.phone = phone
                        self.viewModel.updateContact()
                    }
                }
                isAdding = true
                name = ""
                company = ""
                phone = ""
            } ){
                Text(isAdding ? "Add":"Save").frame(maxWidth: .infinity).padding().background(Color.blue).foregroundColor(Color.white).cornerRadius(10)
            }
            
            List {
                ForEach(viewModel.contacts){ contact in
                    Text(contact.name).onTapGesture {
                        
                        self.contact = contact
                        self.name = contact.name
                        self.company = contact.company
                        self.phone = contact.phone
                        self.isAdding = false
                    }
                    
                }.onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        viewModel.deleteContact(index: index)
                    }
                })
            }.listStyle(PlainListStyle())
        }.padding()
    }
}

#Preview {
    ContactListView()
}
