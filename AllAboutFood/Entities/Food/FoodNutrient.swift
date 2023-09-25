//
//  FoodNutrient.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import UIKit

struct FoodNutrient: Codable {
    let type: String?
    let nutrient: Nutrient?
    let foodNutrientDerivation: FoodNutrientDerivation?
    let nutrientAnalysisDetails: NutrientAnalysisDetails?
    let id: Int?
    let amount: Double?
    let dataPoints: Int?
    let min: Int?
    let max: Int?
    let median: Int?
    let number: String?
    let name: String?
    let unitName: String?
    let derivationCode: String?
    let derivationDescription: String?
    
    func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NutrientsTableViewCell.identifier, for: indexPath) as? NutrientsTableViewCell else {
            return UITableViewCell()
        }
        cell.nutrient = self
        cell.selectionStyle = .none
        return cell
    }
}
