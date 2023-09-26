//
//  Endpoints.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import Foundation
enum Endpoints {
    
    enum GoogleCustomSearchApi {
        static let key = "AIzaSyDdcxrb46pGupqf0aJnNsXpm8ppJT1kfPw"
        static let searchEngineID = "21a263ec693f44272"
        static func apiImagesGoogle(with query: String, and quantity: Int) -> String {
            "https://www.googleapis.com/customsearch/v1?key=\(key)&cx=\(searchEngineID)&q=\(query)&searchType=image&num=\(quantity)"
        }
    }
    enum FoodApi {
        static let key = "uIVjmptXUEJZGU8FmgqJC0zO0tx8mQiURvKYMeAX"
        static let urlBase = "https://api.nal.usda.gov/fdc/"
        static func list(with quantity: Int, and page: Int) -> String {
            "\(urlBase)/v1/foods/list?api_key=\(key)&pageSize=\(quantity)&pageNumber=\(page)"
        }
        static func search(this text: String, with quantity: Int, and page: Int) -> String {
            "\(urlBase)/v1/foods/list?api_key=\(key)&query=\(text)&pageSize=\(quantity)&pageNumber=\(page)"
        }
    }
    
    enum PlatziApi {
        static let urlBase = "https://platzi-tweets-backend.herokuapp.com/api/v1"
        static let auth = urlBase + "/auth"
        static let register = urlBase + "/register"
        static let posts = urlBase + "/posts"
        static func deletePost(id: String) -> String {
            "\(posts)/\(id)"
        }
    }
}
