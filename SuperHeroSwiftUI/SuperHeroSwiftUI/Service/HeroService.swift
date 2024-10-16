//
//  HeroService.swift
//  SuperHeroSwiftUI
//
//  Created by Alumno on 16/10/24.
//

import Foundation

class HeroService {
    private var url = "https://www.superheroapi.com/api.php/f274286a22873ec9fc7a5782940f7ca2/search/"
    
    func getHeroesByName(name: String, completion: @escaping (Heroes) -> Void) {
        url += name
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if success {
                guard let data = data else {
                    completion([])
                    return
                }
                do {
                    let wrapper = try JSONDecoder().decode(HeroesWrapper.self, from: data)
                    completion(wrapper.heroes)
                    
                } catch (let exception){
                    completion([])
                }
            }
        }
    }
}
