//
//  ImageResult.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import Foundation

struct ImageResult: Codable {
    let kind: String
    let title: String
    let htmlTitle: String
    let link: URL
    let displayLink: String
    let snippet: String
    let htmlSnippet: String
    let mime: String
    let fileFormat: String
    let image: ImageDetails
}
