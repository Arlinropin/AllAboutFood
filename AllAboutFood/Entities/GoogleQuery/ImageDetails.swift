//
//  ImageDetails.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import Foundation

struct ImageDetails: Codable {
    let contextLink: URL
    let height: Int
    let width: Int
    let byteSize: Int
    let thumbnailLink: URL
    let thumbnailHeight: Int
    let thumbnailWidth: Int
}
