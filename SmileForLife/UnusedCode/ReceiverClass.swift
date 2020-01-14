////
////  Receiver.swift
////  SmileForLife
////
////  Created by Lisa Swanson on 10/9/19.
////  Copyright © 2019 Lisa Swanson. All rights reserved.
////
//
//import Foundation
//
//
//class Receiver: ReceiveNotificationsProtocol {
//
//  var userInfoStatusValue: String
//  var userInfoStatusKey: String //CheckValidity
//  var notificationOfInterest: Notification.Name
//
//  init(notification: Notification.Name ) {
//    self.userInfoStatusValue = UserDefaults.standard.object(forKey: UserInfoStatusKey.colorMode.rawValue) as! String
//    self.userInfoStatusKey = UserInfoStatusKey.colorMode.rawValue
//    self.notificationOfInterest = notification
//
//    subscribe()
//  }
//
//  func subscribe() {
//    NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(_:)), name: notificationOfInterest, object: nil)
//  }
//
//  func unsubscribe() {
//    NotificationCenter.default.removeObserver(self, name: notificationOfInterest, object: nil)
//  }
//
//  func handleNotification() {
//    fatalError("ERROR:  You must override the [handleNotification] method.")
//  }
//
//  @objc func receiveNotification(_ notification: Notification) {
//
//    if let userInfo = notification.userInfo, let status = userInfo[userInfoStatusKey] as? String {
//      userInfoStatusValue = status
//      handleNotification()
//
//      print("Notification \(notification.name)")
//    }
//  }
//}
