//
//  Protocols.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/5/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import Foundation
import UIKit

protocol SetupUI {
  func setupUIStatic()
  func setupUIDynamic()
}

protocol MonthViewDelegate: class  {
  func didChangeMonth(sender: UIButton)
}

protocol NotifyCollViewEventsDeletedDelegate {
  func notifyCVEventsToBeDeleted(dayOfEvent: Int, indexOfEvent: Int, dismissVC: Bool)
}

protocol PersistanceViewModelMain: class {
  func set(stack: ViewModelMainView)
}

protocol UpdateSegmentControlDelegate {
  func notifiyMainControlerOfSegmentChange(indexOfSegment: Int)
}

protocol HandleTapGesture: class {
  func addCustomHygieneEvent(eventType: Int, date: Date, tag: Int)
}

protocol PresentViewControllerFromMain {
  func presentViewController(index: Int)
}

protocol NotificationsViewModelItem {
  var type: NotificationsViewModelItemType { get }
  var rowCount: Int { get }
  var sectionTitle: String { get }
}

extension NotificationsViewModelItem {
  var rowCount: Int {
    return 1
  }
}

//protocol TransmitNotificationsProtocol {
//  var userInfoColorModeStatus: String { get }
//  var notificationName: Notification.Name { get }
//  func notifyReceivers(about changeTo: String) -> Void
//}
//
//extension TransmitNotificationsProtocol {
//  func notifyReceivers(about changeTo: String) -> Void {
//    NotificationCenter.default.post(name: notificationName, object: self, userInfo: [userInfoColorModeStatus : changeTo])
//  }
//}
//
//protocol ReceiveNotificationsProtocol {
//  var userInfoStatusValue: String { get set }
//  var userInfoStatusKey: String { get }
//  var notificationOfInterest: Notification.Name { get }
//  func subscribe()
//  func unsubscribe()
//  func handleNotification()
//}
