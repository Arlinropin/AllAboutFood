//
//  NutrientsTableViewCell.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import UIKit

class NutrientsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!

    static let identifier = "NutrientsTableViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    var nutrient: FoodNutrient? {
        didSet {
            nameLabel.text = nutrient?.name
            amountLabel.text = "\(nutrient?.amount ?? 0.0)"
            unitLabel.text = nutrient?.unitName
        }
    }
}
