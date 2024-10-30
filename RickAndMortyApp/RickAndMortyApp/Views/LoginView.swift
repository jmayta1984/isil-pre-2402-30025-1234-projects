//
//  LoginView.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Rick and Morty")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Username", text: $username).textInputAutocapitalization(.never).padding().background(Color.gray.opacity(0.2)).cornerRadius(10).autocorrectionDisabled()
            HStack {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }, label: {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye").foregroundColor(Color.gray)
                })
            }.textInputAutocapitalization(.never).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            
            Button(action: {
                AuthService().login(username: username, password: password) { data, message in
                    if let data = data {
                        print(data.firstName)
                        print(data.lastName)
                    }
                    
                    if let message = message {
                        print(message)
                    }
                }
                
            }, label: {
                Text("Login").frame(maxWidth: .infinity).padding().background(Color.blue).foregroundColor(.white).cornerRadius(10)
            })
            
        }.padding()
    }
}

#Preview {
    LoginView()
}
