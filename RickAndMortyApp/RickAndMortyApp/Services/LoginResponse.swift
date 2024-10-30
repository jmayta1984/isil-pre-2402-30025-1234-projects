//
//  LoginResponse.swift
//  RickAndMortyApp
//
//  Created by Alumno on 30/10/24.
//

import Foundation

struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let id: Int
    let email: String
    let username: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
}
