//
//  Food.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import Foundation
import UIKit
struct Food: Codable {
    let discontinuedDate: String?
    let foodComponents: [FoodComponent]?
    let foodAttributes: [FoodAttributeType]?
    let foodPortions: [FoodPortion]?
    let fdcId: Int
    let description: String
    let publicationDate: String?
    let foodNutrients: [FoodNutrient]?
    let dataType: String?
    let foodClass: String?
    let modifiedDate: String?
    let availableDate: String?
    let brandOwner: String?
    let dataSource: String?
    let brandedFoodCategory: String?
    let gtinUpc: String?
    let householdServingFullText: String?
    let ingredients: String?
    let marketCountry: String?
    let servingSize: Double?
    let servingSizeUnit: String?
    let foodUpdateLog: [FoodUpdateLog]?
    let labelNutrients: [String: LabelNutrient]?

    func createNutrientsStackViews() -> [UIStackView] {
        var stackViews: [UIStackView] = []

        for nutrient in foodNutrients ?? [] {
            let nameLabel = UILabel()
            nameLabel.numberOfLines = 0
            nameLabel.text = nutrient.name

            let amountLabel = UILabel()
            amountLabel.text = "\(nutrient.amount ?? 0.0) \(nutrient.unitName ?? "")"

            let stackView = UIStackView(arrangedSubviews: [nameLabel, amountLabel])
            stackView.axis = .horizontal
            stackView.spacing = 1

            stackViews.append(stackView)
        }

        return stackViews
    }
}
