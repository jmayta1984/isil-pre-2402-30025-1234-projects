//
//  HttpRequestHelper.swift
//  SuperHeroSwiftUI
//
//  Created by Alumno on 9/10/24.
//

import Foundation

class HttpRequestHelper{
    
    func GET(url: String, completion: @escaping (Bool, Data?, String? ) -> Void ) {
        
        guard let url = URL(string: url) else { return }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Error: problem callig GET method")
                completion(false, nil, "Error: problem callig GET method")
                return
            }
            
            guard let data = data else {
                print("Error: did not receive data")
                completion(false, nil, "Error: did not receive data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: HTTP request failed")
                completion(false, data, "Error: HTTP request failed" )
                return
            }
            completion(true, data, nil)
            
        }.resume()
        
        
    }
    
}
