//
//  Classes+Structs.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/27/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import Foundation
import UIKit

class HygieneCollectionViewEvent {  
  var year: Int = 0
  var month: Int = 0
  var numberOfDaysInMonth = 0
  var indexOfFirstDayOfMonth = 0
  var numberOfWeeksInMonth: CGFloat = 0
  var days: [(Int, [DailyHygieneEvents])] = [(0, [])]
}

class DailyHygieneEvents {
  var date: Date = Date()
  var eventName: String?
  var eventImageName: String?
  
}

struct StateOfSegmentControl {
  var indexSelected: Int
  var indexDeSelected: Int
}

struct UpdateSegment {
  var select: Int = 0
  var deSelect: Int = 0
}

struct ImageViewSizes {
  var containerHeight: CGFloat = 0
  var remainingScreenHeight: CGFloat = 0
  var segmentViewHeight: CGFloat = 0
  var imageWidthAndHeight: CGFloat = 0
  var logoHeight: CGFloat = 0
  var userNameHeightAnchor: CGFloat = 0
  var eventsStackviewHeightAnchor: CGFloat = 0
  var segmentControlPadding: CGFloat = 0
}

class AddBrushButton: UIButton {

  var isOn: Bool = true
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initButton()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }
  
  func initButton() {
    translatesAutoresizingMaskIntoConstraints = false
    contentMode = .scaleAspectFit
//    layer.borderWidth = 2
//    layer.borderColor = UIColor.cpSlate.cgColor
//    layer.cornerRadius = 8
    addTarget(self, action: #selector(AddBrushButton.buttonPressed), for: .touchUpInside)
  }
  
  @objc func buttonPressed() {
    activateButton(bool: !isOn)
  }
  
  private func activateButton(bool: Bool) {
    isOn = bool
    let image = bool ? #imageLiteral(resourceName: "brushIconNoPlus") : #imageLiteral(resourceName: "brushIconNoPlusHL")
    
    setImage(image, for: .normal)
  }
}

class AddFlossButton: AddBrushButton {
  override func initButton() {
      translatesAutoresizingMaskIntoConstraints = false
      contentMode = .scaleAspectFit
  //    layer.borderWidth = 2
  //    layer.borderColor = UIColor.cpSlate.cgColor
  //    layer.cornerRadius = 8
      addTarget(self, action: #selector(AddFlossButton.buttonPressed), for: .touchUpInside)
    }
}

class AddBushFlossButton: AddBrushButton {
  override func initButton() {
      translatesAutoresizingMaskIntoConstraints = false
      contentMode = .scaleAspectFit
  //    layer.borderWidth = 2
  //    layer.borderColor = UIColor.cpSlate.cgColor
  //    layer.cornerRadius = 8
      addTarget(self, action: #selector(AddBushFlossButton.buttonPressed), for: .touchUpInside)
    }
}
