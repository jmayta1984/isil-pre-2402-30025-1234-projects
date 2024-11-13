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
    
    var body: some View {
        VStack {
            
            Spacer()
            TextField("Name", text: $name).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            
            TextField("Company", text: $company).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            TextField("Phone", text: $phone).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            
            Button(action: {
                self.viewModel.addContact(name: self.name, company: self.company, phone: self.phone)
            } ){
                Text("Add").frame(maxWidth: .infinity).padding().background(Color.blue).foregroundColor(Color.white).cornerRadius(10)
            }
            
            List {
                ForEach(viewModel.contacts){ contact in
                    Text(contact.name)
                    
                }
            }.listStyle(PlainListStyle())
        }.padding()
    }
}

#Preview {
    ContactListView()
}
