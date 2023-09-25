//
//  FoodUpdateLog.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

struct FoodUpdateLog: Codable {
    let discontinuedDate: String?
    let foodAttributes: [FoodAttribute]?
    let fdcId: Int?
    let description: String?
    let publicationDate: String?
    let dataType: String?
    let foodClass: String?
    let modifiedDate: String?
    let availableDate: String?
    let brandOwner: String?
    let brandName: String?
    let dataSource: String?
    let brandedFoodCategory: String?
    let gtinUpc: String?
    let ingredients: String?
    let marketCountry: String?
    let servingSize: Double?
    let servingSizeUnit: String?
    let packageWeight: String?
    let notaSignificantSourceOf: String?
}
