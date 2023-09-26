//
//  PostRequest.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

struct PostRequest: Codable {
    let text: String
    let imageUrl: String
    let videoUrl: String
    let location: Location
}
