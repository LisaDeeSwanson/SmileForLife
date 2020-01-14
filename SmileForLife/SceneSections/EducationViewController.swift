//
//  EducationViewController.swift
//  smile4Life
//
//  Created by Lisa Swanson on 10/4/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController, SetupUI {
  

//  var colorModeKey: Int!
  var currentViewNeedsUpdate = false {
    didSet {
      print("In currentViewNeedsUpdate")
      view.setNeedsDisplay()
    }
  }

  let toggleSwitch: UISwitch = {
    let tS = UISwitch()
    tS.translatesAutoresizingMaskIntoConstraints = false
    tS.tintColor = .foreground(colorMode: ColorMode.light)
    tS.thumbTintColor = .highlight(colorMode: ColorMode.light)
    tS.onTintColor = .background(colorMode: ColorMode.light)
    tS.layer.shadowOffset = CGSize(width: 2, height: 2)
    tS.layer.shadowColor = UIColor.highlight(colorMode: ColorMode.light).cgColor
    
    return tS
  }()

  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    guard let userColorMode = UserDefaults.standard.object(forKey: UserInfoStatusKey.colorMode.rawValue) else { return }
    let currentColorMode = ColorMode.init(rawValue: userColorMode as! String)
    print(currentColorMode!)
    setupUIDynamic()
    view.backgroundColor = .background(colorMode: currentColorMode!)
    
  }
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setupUIStatic()
    }
  
  func setupUIStatic() {
    
  }
  
  func setupUIDynamic() {
    
  }
    


}
