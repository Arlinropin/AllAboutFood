//
//  HeaderDetailTable.swift
//  AllAboutFood
//
//  Created by Apiux on 24-09-23.
//

import UIKit

class HeaderDetailTable: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    var title: String? {
        didSet {
            setupUI()
        }
    }

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.black
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()

    private func setupUI() {
        backgroundColor = .systemGray2.withAlphaComponent(0.1)
        
        // Agrega un label
        titleLabel.text = title
        addSubview(titleLabel)
        
        // Agrega una línea debajo del label
        addSubview(lineView)
        
        // Añade las restricciones para el label
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        // Añade las restricciones para la línea
        lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        lineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    

    
}
