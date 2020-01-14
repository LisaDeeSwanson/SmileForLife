
//  ViewModel+MainView.swift
//  Smile_4_Life
//
//  Created by Lisa Swanson on 8/9/18.
//  Copyright © 2018 Technology Speaks. All rights reserved.
//

import Foundation
import CoreData

class ViewModelMainView {

  var coreDataContext: CoreDataManager!
  var fetchedCalendarUserResults: NSFetchedResultsController<CalendarUsers>!
  var currentUser: CalendarUsers!
//  let userDefaultsStandard = UserDefaults.standard
  init() {
    print("ViewModelMainInit,ViewModelMainInit,ViewModelMainInit,ViewModelMainInit,ViewModelMainInit,ViewModelMainInit,")
  if UserDefaults.standard.bool(forKey: kInitialUser) {
//    self.currentUser = self.getCurrentUser()
  }
    
}

  func createNotification(calendarUser: CalendarUsers, time: Date, eventType: Int) {
    let time = DateHelpers.getTimeFromDate(time)
    let createNotification = ScheduledNotifications(context: coreDataContext.mainContext)
    createNotification.owner = calendarUser
    createNotification.eventType = Int16(eventType)
    createNotification.time = time
    coreDataContext.saveContext()
    
  }
  
  func getAllNotifications(_ currentCalendarUser: CalendarUsers) -> [ScheduledNotifications] {
    let fetchNotifications = NSFetchRequest<ScheduledNotifications>(entityName: "Notifications")
    
    do {
      let predicateUser = NSPredicate(format: "owner.name == %@", currentCalendarUser.name as CVarArg)
      let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateUser])
      let notificationsTimeSort = NSSortDescriptor(key: #keyPath(ScheduledNotifications.time), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
      fetchNotifications.sortDescriptors = [notificationsTimeSort]
      fetchNotifications.predicate = andPredicate
      let events = try coreDataContext.mainContext.fetch(fetchNotifications)
      return events
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
    return []
    
  }
  
  func updateNotifications() {
    
  }
  
  func deleteNotification(currentCalendarUser: CalendarUsers, time: String, type: String) {
    let notificationToDelete = NSFetchRequest<ScheduledNotifications>(entityName: "Notifications")
    let predicateUser = NSPredicate(format: "owner.name == %@", currentCalendarUser.name as CVarArg)
    let predicateEvent = NSPredicate(format: "time == %@", time as CVarArg)
    let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateUser, predicateEvent])
    notificationToDelete.predicate = andPredicate
    
    do {
      let events = try coreDataContext.mainContext.fetch(notificationToDelete)
      switch type {
      case "validate":
        print("Need to create an update function")
        updateNotifications()
      case "delete":
        for event in events {
          coreDataContext.mainContext.delete(event)
        }
        try coreDataContext.mainContext.save()
      default:
        print("Should not every be printing")
      }
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
  }

  func getInitialUser() -> CalendarUsers {
    if !UserDefaults.standard.bool(forKey: kInitialUser) {
      let initialUser = CalendarUsers(context: coreDataContext.mainContext)
      let userID = UserDefaults.standard.object(forKey: kCurrentCalendarUserID) as! String
      let name = UserDefaults.standard.object(forKey: kName) as! String
      initialUser.setValue(UUID(uuidString: userID), forKey: kUserID)
      initialUser.setValue(name, forKey: kName)
      initialUser.setValue(kDefaultImage, forKey: kImage)
      coreDataContext.saveContext()
      currentUser = initialUser
      UserDefaults.standard.set(true, forKey: kInitialUser)
    }
    return getCurrentUser()
  }

  func getCurrentUser() -> CalendarUsers {
      let getCurrentUser = CalendarUsers.fetchRequest() as NSFetchRequest<CalendarUsers>
      let query = NSPredicate(format: "%K == %@", "userID", kUserDefaultID! as CVarArg)
      getCurrentUser.predicate = query
//    var currentUser = CalendarUsers(context: coreDataContext.mainContext)
    
      // Perform the fetch with the predicate
      do {
        var fetchResult: [CalendarUsers] = try coreDataContext.mainContext.fetch(getCurrentUser)
        guard let user = fetchResult.popLast() else { return currentUser }
        self.currentUser = user
        if fetchResult.isEmpty {
          print("in ViewModelMainView.getCurrentUser - no current user in core data")
        }
        return currentUser
      } catch {
        let fetchError = error as NSError
        debugPrint(fetchError)
      }
    
    return currentUser
  }
  
  func updateCalendarUser(calendarUser: CalendarUsers) {

    let updateUser = CalendarUsers.fetchRequest() as NSFetchRequest<CalendarUsers>
    let query = NSPredicate(format: "userID == %@", calendarUser.userID as CVarArg)
    updateUser.predicate = query
    do {
      let fetchResult: [CalendarUsers] = try coreDataContext.mainContext.fetch(updateUser)
      let user = fetchResult[0]
      user.setValue(calendarUser.name, forKey: "name")
      user.setValue(calendarUser.image, forKey: "image")
      coreDataContext.saveContext()
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
  }
  
  func getAllCalendarUsers() -> [CalendarUsers] {
    let fetchRequest = NSFetchRequest<CalendarUsers>(entityName: "CalendarUsers")
    do {
      let calendarUsers = try coreDataContext.mainContext.fetch(fetchRequest)
      return calendarUsers
    } catch let savErr {
      print("CalendarUsers fetch request failed: \(savErr)")
    }
    return []
  }
  
  func createNewCalendarUser(calendarUser: CalendarUsers) {
    calendarUser.setValue(calendarUser.userID, forKey: "userID")
    calendarUser.setValue(calendarUser.name, forKey: "name")
    calendarUser.setValue(calendarUser.image, forKey: "image")
    coreDataContext.saveContext()
  }
  
  func fetchCalendarUsers() -> NSFetchedResultsController<CalendarUsers> {
    let calendarUserFetchRequest = NSFetchRequest<CalendarUsers>(entityName: "CalendarUsers")
    let calendarUserSort = NSSortDescriptor(key: #keyPath(CalendarUsers.name), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
    calendarUserFetchRequest.sortDescriptors = [calendarUserSort]
    
    do {
      fetchedCalendarUserResults = NSFetchedResultsController(fetchRequest: calendarUserFetchRequest, managedObjectContext: coreDataContext.mainContext, sectionNameKeyPath: nil, cacheName: nil)
      try fetchedCalendarUserResults.performFetch()
      fetchedCalendarUserResults.delegate = self as? NSFetchedResultsControllerDelegate
    } catch let error as NSError {
      print("Could not fetch CalendarUsers. \(error), \(error.userInfo)")
    }
    return fetchedCalendarUserResults
  }
  
  func cascadeDeleteCalendarUser(user: CalendarUsers) {
    coreDataContext.mainContext.delete(user)
    coreDataContext.saveContext()
    
  }
  
  func addHygieneEvent(event: (owner: CalendarUsers, date: Date, eventType: Int)) {

    var yearObject = getYearObject(year: Calendar.current.component(.year, from: event.date))
    let yearMO = yearObject.popLast()
    
    let userHygieneEvent = HygieneEvents(context: coreDataContext.mainContext)
    userHygieneEvent.date = event.date
    userHygieneEvent.eventType = Int16(event.eventType)
    userHygieneEvent.owner = event.owner
    userHygieneEvent.yearOfEvent = yearMO!
    coreDataContext.saveContext()
    
  }
  
  // Remove before ship
  func authenticateData(name: String) {
    let fetchHygieneEvents = NSFetchRequest<HygieneEvents>(entityName: "HygieneEvents")
    do {
      //      let currentYear = Calendar.current.component(.year, from: year)
      let predicateUser = NSPredicate(format: "owner.name == %@", name as CVarArg)
//      let predicateYear = NSPredicate(format: "ANY yearOfEvent.year == \(year)")
      let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateUser])
      let hygieneEventSort = NSSortDescriptor(key: #keyPath(HygieneEvents.date), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
      fetchHygieneEvents.sortDescriptors = [hygieneEventSort]
      fetchHygieneEvents.predicate = andPredicate
      let events = try coreDataContext.mainContext.fetch(fetchHygieneEvents)
      //      let years = try coreDataContext.mainContext.fetch(NSFetchRequest<Years>(entityName: "Years"))
      //      print(years.count)
      
      // create data structure
      for event in events {
        print(event.date, event.yearOfEvent.year, event.eventType, event.owner.name)
      }
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
    
  }
  // End remove before ship
  
  func deleteHygieneEvent(currentUser: CalendarUsers, dateOfEvent: Date) {
    let eventToDelete = NSFetchRequest<HygieneEvents>(entityName: "HygieneEvents")
    let predicateUser = NSPredicate(format: "owner.name == %@", currentUser.name as CVarArg)
    let predicateEvent = NSPredicate(format: "date == %@", dateOfEvent as NSDate)
    let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateUser, predicateEvent])
    eventToDelete.predicate = andPredicate
    
    do {
      let events = try coreDataContext.mainContext.fetch(eventToDelete)
      for event in events {
        coreDataContext.mainContext.delete(event)
      }
      try coreDataContext.mainContext.save()
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
    
  }
  
  func getAllHygieneEventsByCalendarUser(calendarUser: CalendarUsers, year: Int) -> [HygieneEvents] {
    let fetchHygieneEvents = NSFetchRequest<HygieneEvents>(entityName: "HygieneEvents")
    
    self.authenticateData(name: calendarUser.name)
    do {
      let predicateUser = NSPredicate(format: "owner.name == %@", calendarUser.name as CVarArg)
      let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateUser])
      let hygieneEventSort = NSSortDescriptor(key: #keyPath(HygieneEvents.date), ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
      fetchHygieneEvents.sortDescriptors = [hygieneEventSort]
      fetchHygieneEvents.predicate = andPredicate
      let events = try coreDataContext.mainContext.fetch(fetchHygieneEvents)
      return events
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
    return []
  }
  
  private func getYearObject(year: Int) -> [Years] {
    let getYear = NSFetchRequest<Years>(entityName: "Years")
    let query = NSPredicate(format: "year == %@", String(year))
    getYear.predicate = query
    var fetchResult: [Years]?
    do {
      repeat {
        fetchResult = try coreDataContext.mainContext.fetch(getYear)
        if fetchResult!.isEmpty {
          let years = Years(context: coreDataContext.mainContext)
          years.year = Int16(year)
          coreDataContext.saveContext()
          fetchResult?.append(years)
          print(fetchResult?[0].year ?? 0)
        }
      } while fetchResult!.isEmpty
      
      return fetchResult!
    } catch {
      let fetchError = error as NSError
      debugPrint(fetchError)
    }
    return []
  }
}

final class CurrentCalendarUser {
  var currentUser: CalendarUsers
  
  init(currentUser: CalendarUsers) {
    self.currentUser = CalendarUsers()
  }
}

final class CalendarUserDefaults {
  
  var userID: UUID
  var name: String
  var image: Data
  
  init() {
    let userGetDefaults = UserDefaults.standard
    let stringUUID = userGetDefaults.object(forKey: "userID") as! String
    userID = UUID(uuidString: stringUUID)!
    name = userGetDefaults.object(forKey: "calendarUserName") as! String
    image = userGetDefaults.data(forKey: "userImage")!
  }
  
}

class Events {
  
  let year: Int = 0
  let month: Int = 0
  let days: ([Int], [DailyEvents]) = ([], [])
}

class DailyEvents {
  
  let eventName = ""
  let eventImageName = ""
  
}
