//
//  RequestDetails.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

struct RequestDetails: Codable {
    let title: String
    let totalResults: String
    let searchTerms: String
    let count: Int
    let startIndex: Int
    let inputEncoding: String
    let outputEncoding: String
    let safe: String
    let cx: String
    let searchType: String
}
