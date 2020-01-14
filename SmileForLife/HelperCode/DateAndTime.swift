//
//  DateAndTime.swift
//  SmileForLife
//
//  Created by Lisa Swanson on 10/27/19.
//  Copyright © 2019 Lisa Swanson. All rights reserved.
//

import Foundation

class DateHelpers {
  
  static func getRandomDate() -> Date {
    let secsInADay = 60.0 * 60.0 * 24
    let multiplyerArray: [Double] = [1,-1,24,-25,28,-30,31,40,-40,-50,50, 150, -150, 200, -200, 275, -275]
    guard let randomYear = multiplyerArray.randomElement() else { return Date() }
    let timeInterval = secsInADay * randomYear
    let date = Date(timeInterval: timeInterval, since: Date())
    
    return date
  }
  
  static func getTimeFromDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm a"
    
    return dateFormatter.string(from: date)
  }
  
  static func getStringTimeFromDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm a"
    return dateFormatter.string(from: date)
  }
  
  static func convertStringDateToNSDate(_ date: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.locale = Locale.current
    return dateFormatter.date(from: date)!
  }
  
  static func getSectionHeaderName(_ date: Date) -> String {
    return self.getDateFormatter("EEEE-MMMM-dd").string(from: date)
  }
  
  static func getDateFormatter(_ templete: String) -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = templete
    formatter.setLocalizedDateFormatFromTemplate(templete)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }
  
  static func getPrettyDate(date: Date) -> String {
    let template = "EEEE, MMM d, yyyy"
    let prettyDate = self.getDateFormatter(template).string(from: date)
    return prettyDate
  }
  
  static func getDateFromDateComps(year: Int, month: Int, day: Int) -> String {
    var dateComps = DateComponents()
    dateComps.year = year
    dateComps.month = month
    dateComps.day = day
    let date = Calendar.current.date(from: dateComps)!
    return DateHelpers.getPrettyDate(date: date)
  }
  
  func getDate() {
    let _ = Calendar.current
    var dateComponents = DateComponents()
    
    dateComponents.month = 11
    dateComponents.day = 20
    dateComponents.hour = 16
    dateComponents.minute = 5
  }
}
