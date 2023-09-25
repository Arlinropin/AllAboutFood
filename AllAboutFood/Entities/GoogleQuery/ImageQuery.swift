//
//  ImageQuery.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

struct ImageQuery: Codable {
    let kind: String
    let url: URLDetails
    let queries: QueryDetails
    let context: ContextDetails
    let searchInformation: SearchInformation
    let items: [ImageResult]
}
