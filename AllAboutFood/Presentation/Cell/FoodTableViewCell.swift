//
//  FoodTableViewCell.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

import Foundation
import UIKit

enum DataType: CodingKey {
    case branded
    case foundation
    case survey
    case legacy
    case experimental
    
    init(_ string: String?) {
        switch string {
        case "Branded": self = .branded
        case "Foundation": self = .foundation
        case "Survey (FNDDS)": self = .survey
        case "SR Legacy": self = .legacy
        default:
            self = .experimental // O puedes elegir el valor por defecto que desees
        }
    }
}

struct FoodLight {
    var id: Int
    var name: String
    var dataType: DataType?
    var brandName: String
}

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var foodName: UILabel!
    @IBOutlet private weak var brandNameLabel: UILabel!
    @IBOutlet private weak var circle: UIView!
    @IBOutlet private weak var typeLabel: UILabel!
    
    static let identifier = "FoodTableViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    let alphaBackground = 0.1
    let placeholderImage = UIImage(named: "icon")
    var network: Network?
    var food: FoodLight? {
        didSet {
            foodName.text = food?.name
            typeLabel.text = food?.dataType?.stringValue.first?.uppercased()
            switch food?.dataType {
            case .branded:
                brandNameLabel.text = food?.brandName
                circle.backgroundColor = .systemRed.withAlphaComponent(alphaBackground)
            case .foundation:
                circle.backgroundColor = .systemCyan.withAlphaComponent(alphaBackground)
            case .survey:
                circle.backgroundColor = .systemIndigo.withAlphaComponent(alphaBackground)
            case .legacy:
                circle.backgroundColor = .systemYellow.withAlphaComponent(alphaBackground)
            case .experimental:
                circle.backgroundColor = .systemGray.withAlphaComponent(alphaBackground)
            case nil:
                circle.backgroundColor = .white
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        commonInit()
    }
    func commonInit() {
        foodName.text = ""
        brandNameLabel.text = ""
        circle.layer.cornerRadius = circle.frame.height / 2
        circle.backgroundColor = .white
        typeLabel.text = ""
    }
}
