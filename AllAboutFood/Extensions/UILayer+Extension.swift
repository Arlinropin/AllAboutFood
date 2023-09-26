//
//  CALayer+Extension.swift
//  AllAboutFood
//
//  Created by Apiux on 25-09-23.
//

import UIKit

extension CALayer {
    func addHorizontalGradient(bounds: CGRect, percentage: NSNumber, topColor: UIColor, bottomColor: UIColor){
        // Crea un gradiente layer.
        let gradientLayer = CAGradientLayer()

        // Define los colores del gradiente.
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]

        // Define las ubicaciones donde los colores cambian.
        gradientLayer.locations = [percentage, 1.0]

        // Define la dirección del gradiente (vertical).
        gradientLayer.startPoint = CGPoint(x: 0.4, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.6, y: 0.8)

        // Ajusta el tamaño y la posición del gradiente.
        gradientLayer.frame = bounds

        // Agrega el gradiente a la vista.
        insertSublayer(gradientLayer, at: 0)
    }
}
