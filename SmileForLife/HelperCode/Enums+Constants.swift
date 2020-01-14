//
//  Enums.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/9/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import Foundation
import UIKit

enum ColorMode: String {
  case light
  case dark
}

enum UserInfoStatusKey: String {
  case colorMode
  case currentCalendarKey
}

enum UpdateColorMode: String {
  case hasChanged
}

enum NotificationsViewModelItemType {
  case allowNotifications
  case notificationEventType
  case datePicker
  case saveNotification
  case scheduledNotifications
}

enum NotificationImageNames: String {
  case brush
  case floss
  case brushNFloss
}

enum UISegmentedControlImageNames: String {
  case calendarSCIcon
  case peopleSCIcon
  case remindersSCIcon
  case timerSCIcon
  case gearSCIcon
}

enum MyTheme {
  case light
  case dark
}

enum ReuseID: String {
  case cellId
}

enum GlobalConstants: String {
  case cellId
}

var lastSender = UISegmentedControl()
var segment = UpdateSegment()

var kUserDefaultID: UUID? {
  let currentUserDefaults = UserDefaults.standard
  let stringUUID = currentUserDefaults.object(forKey: kCurrentCalendarUserID) as! String
  let id = UUID(uuidString: stringUUID)
  return id
}

let kNotifyParentMainViewUserHasChanged = "mainHomeWillUpdateContainerView"
let kCalendarUserWillAddNewUserToTableViewNotificaiton = "calendarUserWillAddNewUser"
let kCurrentUserHasChangedNotification = "currentUserHasChanged"
let kNotifyChildViewCalendarCVToLoadNewUser = "updateHygieneEventsCollectionViewData"
let kInsertNewHygieneEvent = "insertNewHygieneEvent"
let kNotifyCollectionViewToLoadDailyEventTV = "loadDailyEventsTableview"

let kName = "name"
let kUserID = "userID"
let kImage = "image"
let kDefaultImage = UIImage(imageLiteralResourceName: "darkAddImage").pngData()
let kDefaultUserID = UUID().uuidString
let kCurrentCalendarUserID = "currentCalendarUserID"
let kInitialUser = "initialUser"
let kEditUser = "isEditedUser"
let kCurrentCalendarUser = "currentCalendarUser"
