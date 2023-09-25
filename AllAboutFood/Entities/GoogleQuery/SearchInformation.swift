//
//  SearchInformation.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

struct SearchInformation: Codable {
    let searchTime: Double
    let formattedSearchTime: String
    let totalResults: String
    let formattedTotalResults: String
}
