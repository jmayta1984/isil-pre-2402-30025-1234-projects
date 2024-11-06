//
//  HttpRequestHelper.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

class HttpRequestHelper {
    
    func POST<T: Encodable, U: Decodable>(url: String, body: T, model: U.Type, completion: @escaping (U?, String?) -> Void ){
        
        guard let url = URL(string: url) else {
            completion(nil, "Error: cannot create URL" )
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonBody = try JSONEncoder().encode(body)
            urlRequest.httpBody = jsonBody
        } catch let encodingError {
            completion(nil, "Error: \(encodingError.localizedDescription)")
            return
        }
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, "Error: problem calling POST")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: HTTP request failed")
                return
            }
            
            do {
                let decodeResponse = try JSONDecoder().decode(model, from: data)
                completion(decodeResponse, nil)
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
                return
            }
        }.resume()
    }
    
    func GET(url: String, completion: @escaping (Bool, Data?, String?) -> Void ) {
        guard let url = URL(string: url) else {
            completion(false, nil, "Error: cannot create URL" )
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(false, nil, "Error: problem calling POST")
                return
            }
            
            guard let data = data else {
                completion(false, nil, "Error: no data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(false, data, "Error: HTTP request failed")
                return
            }
            
           completion(true, data, nil)
        }.resume()
        
        
    }
}
