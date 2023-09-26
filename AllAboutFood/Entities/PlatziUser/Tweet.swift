//
//  Tweet.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

import Foundation

struct Tweet: Codable {
    let id: String
    let author: Author?
    let imageUrl: URL?
    let text: String?
    let videoUrl: URL?
    let location: Location?
    let hasVideo: Bool
    let hasImage: Bool
    let hasLocation: Bool
    let createdAt: String?
}

struct Author: Codable {
    let email: String?
    let names: String?
    let nickname: String?
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double
}
