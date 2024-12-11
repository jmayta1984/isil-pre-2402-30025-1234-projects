//
//  HttpRequestHelper.swift
//  EazyMovies
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class HttpRequestHelper {
    
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
