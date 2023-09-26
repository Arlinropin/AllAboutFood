//
//  RegisterRequest.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let names: String
}
