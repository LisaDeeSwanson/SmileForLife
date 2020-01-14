//
//  TableViewCell.swift
//  Smile_4_Life
//
//  Created by Lisa Swanson on 1/7/19.
//  Copyright © 2019 Technology Speaks. All rights reserved.
//

import UIKit

class NotificationsTVCell: UITableViewCell {

  required init?(coder aDecoder: NSCoder) {
    fatalError("Init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


