//
//  QueryDetails.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

struct QueryDetails: Codable {
    let request: [RequestDetails]
    let nextPage: [RequestDetails]
}
