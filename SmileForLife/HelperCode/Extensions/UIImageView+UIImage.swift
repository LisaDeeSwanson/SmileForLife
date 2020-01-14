//
//  UIImageView+UIImage.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/11/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

extension UIImageView {
  
  static func setCircularImageStyle(image: UIImageView) -> UIImageView {
    image.layer.cornerRadius = image.frame.width / 2
    image.layer.borderColor = UIColor.darkGray.cgColor
    image.layer.shadowColor = UIColor.darkGray.cgColor
    image.layer.borderWidth = 2
    image.clipsToBounds = true
    return image
  }
  
  static func setCircularImageOnTableviewCellStyle(image: UIImageView, radius: CGFloat) -> UIImageView {
    image.layer.cornerRadius = radius
    image.layer.borderColor = UIColor.darkGray.cgColor
    image.layer.borderWidth = 2
    image.clipsToBounds = true
    return image
  }
  
//  static func imageColorChange(colorMode: ColorMode) -> UIColor {
//    switch colorMode {
//      case .dark
//        return .light
//      case .light
//        return .light
//    }
//  }
  
  static func baseImageView(image: UIImage) -> UIImageView {
    let iV = UIImageView(frame: .zero)
    iV.image = image
    iV.translatesAutoresizingMaskIntoConstraints = false
    iV.contentMode = .scaleToFill
    iV.backgroundColor = .clear
    return iV
  }
  
  static func circularUserImageView(image: UIImage, radius: CGFloat) -> UIImageView {
    var userImage = baseImageView(image: image)
    userImage = .setCircularImageOnTableviewCellStyle(image: userImage, radius: radius)
    return userImage
  }
}
