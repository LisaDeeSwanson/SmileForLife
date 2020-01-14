//
//  UILabel.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/11/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit


extension UILabel {
  
  static func baseUILabel() -> UILabel {
    let baseLabel = UILabel(frame: .zero)
    baseLabel.translatesAutoresizingMaskIntoConstraints = false
    baseLabel.layer.cornerRadius = 5
    baseLabel.text = "🐝"
    baseLabel.textColor = .black
    baseLabel.textAlignment = .center
    baseLabel.backgroundColor = .blue
    return baseLabel
  }
  
  
  static func setStyleLogoBlueTheme(label: UILabel, fontSize: CGFloat) -> UILabel {
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .cpSlate
    label.backgroundColor = .cpLabel
    label.layer.cornerRadius = 10.0
    label.layer.masksToBounds = true
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
    label.shadowColor = .cpCharcoal
    label.shadowOffset = CGSize(width: 1.0, height: 2.0)
    return label
  }
  
  static func setStyleLightTheme(label: UILabel, fontSize: CGFloat) -> UILabel {
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .cpCharcoal
    label.backgroundColor = .cpNewPop
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
    label.shadowColor = .cpSlate
    label.shadowOffset = CGSize(width: 1.0, height: 2.0)
    return label
  }
}


extension UIButton {
  
  static func baseUIButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tag = 0
    button.contentMode = .scaleAspectFit
    return button
  }
  
  
  
}
