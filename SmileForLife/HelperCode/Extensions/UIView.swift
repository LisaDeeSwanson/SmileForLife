//
//  UIView.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/11/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

extension UIView {
  
  func anchor(top: NSLayoutYAxisAnchor?, topPadding: CGFloat, left: NSLayoutXAxisAnchor?, leftPadding: CGFloat, bottom: NSLayoutYAxisAnchor?, bottomPadding: CGFloat, right: NSLayoutXAxisAnchor?, rightPaddding: CGFloat) {
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
    }
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: bottomPadding).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: rightPaddding).isActive = true
    }
  }
  
  static func containerView() -> UIView {
    let cV = UIView(frame: .zero)
    cV.translatesAutoresizingMaskIntoConstraints = false
    cV.backgroundColor = .blue
    cV.layer.cornerRadius = 5
    cV.layer.masksToBounds = true
    return cV
  }
  
}

