//
//  UIStackView.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/11/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit


extension UIStackView {
  
  static func stackView01() -> UIStackView{
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.layer.cornerRadius = 10
    stack.layer.masksToBounds = true
    stack.axis = .vertical
    stack.spacing = 2
    stack.backgroundColor = UIColor.cpSlate
    stack.distribution = .fillProportionally
    return stack
  }
  
  static func baseStackViewHFE(arrayOfViews: [UIView], spacing: CGFloat) -> UIStackView {
    let sV = UIStackView(arrangedSubviews: arrayOfViews)
    sV.translatesAutoresizingMaskIntoConstraints = false
    sV.axis = .horizontal
    sV.distribution = .fillEqually
    sV.spacing = spacing
    return sV
  }
  
  static func baseStackViewHFP(arrayOfViews: [UIView], spacing: CGFloat) -> UIStackView {
    let sV = baseStackViewHFE(arrayOfViews: arrayOfViews, spacing: spacing)
    sV.distribution = .fillProportionally
    return sV
  }
}
