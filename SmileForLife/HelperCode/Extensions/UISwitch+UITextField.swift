//
//  UISwitch+UITextField.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/11/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

extension UITextField {
  static func setTextFieldStyleLogoBlueTheme(textField: UITextField, placeholder: String) -> UITextField {
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.textColor = .cpCharcoal
    textField.backgroundColor = .cpSlate
    textField.font = UIFont.boldSystemFont(ofSize: 18)
    textField.placeholder = placeholder
    textField.keyboardAppearance = .dark
    return textField
  }
}

extension UISwitch {
  
  static func createSunsetUISwitch() -> UISwitch {
    let toggle = UISwitch()
    toggle.translatesAutoresizingMaskIntoConstraints = false
    toggle.isOn = false
    toggle.onTintColor = UIColor.cpCalendarBackground
    return toggle
  }
  
  //  let logo: UISwitch = {
  //    let uiswitch = UISwitch.createSunsetUISwitch()
  //    uiswitch.isOn = true
  //    uiswitch.addTarget(self, action: #selector(colorModeHasChanged(_:)), for: .valueChanged)
  //    return uiswitch
  //  }()
  
}
