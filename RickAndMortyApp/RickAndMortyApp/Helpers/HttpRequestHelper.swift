//
//  HttpRequestHelper.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

class HttpRequestHelper {
    
    func POST<T: Encodable>(url: String, body: T){
        
        guard let url = URL(string: url) else {
            
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonBody = try JSONEncoder().encode(body)
        } catch let encodingError {
            return
        }
    }
}
