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
    @State var isLoggedIn: Bool = false
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
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
                            isLoggedIn = true
                        }
                        
                        if let message = message {
                            print(message)
                            showAlert = true
                        }
                    }
                    
                }, label: {
                    Text("Login").frame(maxWidth: .infinity).padding().background(Color.blue).foregroundColor(.white).cornerRadius(10)
                })
                
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Login failed "), message: Text("Wrong credentials"), dismissButton: .default(Text("OK")))
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
        }
        
    }
}

#Preview {
    LoginView()
}
