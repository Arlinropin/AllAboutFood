//
//  ImageCollectionViewCell.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightImage: NSLayoutConstraint!
    
    static let identifier = "ImageCollectionViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
}
