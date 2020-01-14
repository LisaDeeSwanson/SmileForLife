////
////  TransmitterView.swift
////  SmileForLife
////
////  Created by Lisa Swanson on 10/9/19.
////  Copyright © 2019 Lisa Swanson. All rights reserved.
////
//
//import UIKit
//
//
//class LogoView: UIView, SetupUI {
//
//  var logo: UIImageView = {
//    let image = UIImage(imageLiteralResourceName: "brushIconNoPlus")
//    let lI = UIImageView.baseImageView(image: image)
//    lI.contentMode = .scaleAspectFill
//    return lI
//  }()
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    print(UIScreen.main.bounds)
//    setupUIStatic()
//    setupUIDynamic()
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//
//  func setupUIStatic() {
//    addSubview(logo)
//    print(logo.frame.width)
//    backgroundColor = .blue
//    NSLayoutConstraint.activate([
//         logo.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//         logo.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
//         logo.heightAnchor.constraint(equalToConstant: 50),
//         logo.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
//      ])
//
//  }
//
//  func setupUIDynamic() {
//
//  }
//
//
//
//
//
//
//}
