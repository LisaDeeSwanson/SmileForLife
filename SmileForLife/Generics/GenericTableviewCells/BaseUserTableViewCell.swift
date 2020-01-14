//
//  CalendarUserTableViewCell.swift
//  Smile_4_Life
//
//  Created by Lisa Swanson on 8/16/18.
//  Copyright © 2018 Technology Speaks. All rights reserved.
//

import UIKit


class MinBaseTableViewCell<U>: UITableViewCell {
  
  var data: U!
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Init(coder:) has not been implemented")
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupGenericUI()
  }
  
  func setupGenericUI() {
    print("In setupGenericUI")
  }
}

class BaseUserTableViewCell<U>: UITableViewCell {
  
  var calendarUser: U!
  
  var baseImageView: UIImageView = {
    var image = UIImageView(image: #imageLiteral(resourceName: "defaultProfile-Small.png"))
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .white
    image = .setCircularImageOnTableviewCellStyle(image: image, radius: 25)
    return image
    }()
  
  var baseTextLabel: UILabel = {
    var text = UILabel()
    text = .setStyleLogoBlueTheme(label: text, fontSize: 18.0)
    text.backgroundColor = .cpCalendarBackground
    text.layer.cornerRadius = 10.0
    return text
  }()
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupGenericCellUI()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("Init(coder:) has not been implemented")
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  private func setupGenericCellUI() {
    addSubview(baseImageView)
    baseImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    baseImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    baseImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    baseImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    addSubview(baseTextLabel)
    baseTextLabel.leftAnchor.constraint(equalTo: baseImageView.rightAnchor, constant: 8).isActive = true
    baseTextLabel.topAnchor.constraint(equalTo: baseImageView.topAnchor).isActive = true
    baseTextLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    baseTextLabel.bottomAnchor.constraint(equalTo: baseImageView.bottomAnchor).isActive = true
    
  }
  
}
