//
//  UISegmentedControl.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/20/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import UIKit


extension UISegmentedControl {
  
  static var containerViewSegmentControl: UISegmentedControl = {
    let cVSC = UISegmentedControl()
    cVSC.insertSegment(with: #imageLiteral(resourceName: UISegmentedControlImageNames.calendarSCIcon.rawValue), at: 0, animated: true)
    cVSC.insertSegment(with: #imageLiteral(resourceName: UISegmentedControlImageNames.peopleSCIcon.rawValue), at: 1, animated: true)
    cVSC.insertSegment(with: #imageLiteral(resourceName: UISegmentedControlImageNames.remindersSCIcon.rawValue), at: 2, animated: true)
    cVSC.insertSegment(with: #imageLiteral(resourceName: UISegmentedControlImageNames.timerSCIcon.rawValue), at: 3, animated: true)
    cVSC.insertSegment(with: #imageLiteral(resourceName: UISegmentedControlImageNames.gearSCIcon.rawValue), at: 4, animated: true)
    let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
    cVSC.setTitleTextAttributes(titleAttributes, for: .normal)
    cVSC.backgroundColor = .systemBlue
    cVSC.tintColor = .lightGray
    cVSC.translatesAutoresizingMaskIntoConstraints = false
    cVSC.isUserInteractionEnabled = true
    return cVSC
  }()
}
