//
//  UIColor.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/11/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit


extension UIColor {

static func background(colorMode: ColorMode) -> UIColor {
  switch colorMode {
    case .dark:
      return .dmBackground
    case .light:
      return .lmBackground
  }
}

static func foreground(colorMode: ColorMode) -> UIColor {
  switch colorMode {
    case .dark:
      return .dmForground
    case .light:
      return .lmForground
  }
}

static func highlight(colorMode: ColorMode) -> UIColor {
  switch colorMode {
    case .dark:
      return .dmHighlight
    case .light:
      return .lmHighlight
  }
}
  
  static func textBlack(colorMode: ColorMode) -> UIColor {
    switch colorMode {
      case .dark, .light:
        return .black
    }
  }

  static let dmBackground = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)
  static let dmForground = UIColor(red: 117/255, green: 138/255, blue: 148/255, alpha: 1)
  static let dmHighlight = UIColor(red: 241/255, green: 243/255, blue: 244/255, alpha: 1)
  static let lmBackground = UIColor(red: 250/255, green: 247/255, blue: 241/255, alpha: 1)
  static let lmForground = UIColor(red: 233/255, green: 217/255, blue: 194/255, alpha: 1)
  static let lmHighlight = UIColor(red: 92/255, green: 85/255, blue: 75/255, alpha: 1)
}

extension UIColor {
  
  static let cpTealColor = UIColor(red: 48/255, green: 164/255, blue: 182/255, alpha: 1)
  static let cpLogoBlue = UIColor(red: 7/255, green: 52/255, blue: 119/255, alpha: 1)
  static let cpLightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
  static let cpBlueGreen = UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1)
  static let cpLightBlue  = UIColor(red: 218/255, green: 235/255, blue: 243/255, alpha: 1)
  static let cpSlate = UIColor(red: 234/255, green: 227/255, blue: 234/255, alpha: 1)
  static let cpSunset = UIColor(red: 152/255, green: 94/255, blue: 109/255, alpha: 1)
  static let cpMint = UIColor(red: 180/255, green: 219/255, blue: 192/255, alpha: 1)
  static let cpSeaFoam = UIColor(red: 167/255, green: 179/255, blue: 165/255, alpha: 1)
  static let cpCharcoal = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
  static let cpCharcoalTrans = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 0.50)
//  static let cpDarkRed = UIColor(red: 169/255, green: 24/255, blue: 24/255, alpha: 1)
  static let cpBackground = UIColor(red: 32/255, green: 21/255, blue: 44/255, alpha: 1)
//  static let cpCalendarBackground = UIColor(red: 99/255, green: 62/255, blue: 90/255, alpha: 1)
  
  // background only
  static let cpBackground2 = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)
   // only Container View BG and UISegmented Control Background
//  static let cpPurpleGrey = UIColor(red: 117/255, green: 138/255, blue: 148/255, alpha: 1)
  // to play with
  static let cpPurpleGrey = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)

  static let cpNewPop1 = UIColor(red: 245/255, green: 206/255, blue: 187/255, alpha: 1)
  static let cpNewPop = UIColor(red: 241/255, green: 243/255, blue: 244/255, alpha: 1)
  
  // label; outter cell background; Calendar Users tableview BG; Buttons on Notification View
//  static let cpCalendarBackground = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)
  static let cpCalendarBackground = UIColor(red: 117/255, green: 138/255, blue: 148/255, alpha: 1)
  static let cpLabel = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)
  static let cpUISegment = UIColor(red: 117/255, green: 138/255, blue: 148/255, alpha: 1)

  
//  static let cpSunset2 = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)
//  static let cpSunset1 = UIColor(red: 81/255, green: 96/255, blue: 103/255, alpha: 1)

//  static let cpBackground2 = UIColor(red: 78/255, green: 78/255, blue: 114/255, alpha: 1)
//  static let cpPurpleGrey = UIColor(red: 200/255, green: 195/255, blue: 229/255, alpha: 1)
  static let cpLightBlue1 = UIColor(red: 177/255, green: 222/255, blue: 249/255, alpha: 1)
//  static let cpSunset1 = UIColor(red: 255/255, green: 182/255, blue: 104/255, alpha: 1)
//  static let cpLightRed1 = UIColor(red: 255/255, green: 135/255, blue: 135/255, alpha: 1)
//  static let cpPink1 = UIColor(red: 203/255, green: 149/255, blue: 170/255, alpha: 1)
  static let cpSunset2 = UIColor(red: 253/255, green: 174/255, blue: 85/255, alpha: 1)
  static let cpLightBlue2 = UIColor(red: 101/255, green: 140/255, blue: 200/255, alpha: 1)
  
}
