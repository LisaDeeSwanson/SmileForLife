//
//  Notifications+CoreDataProperties.swift
//  Smile_4_Life
//
//  Created by Lisa Swanson on 10/14/18.
//  Copyright © 2018 Technology Speaks. All rights reserved.
//
//

import Foundation
import CoreData


extension ScheduledNotifications {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduledNotifications> {
        return NSFetchRequest<ScheduledNotifications>(entityName: "Notifications")
    }

    @NSManaged public var time: String
    @NSManaged public var eventType: Int16
    @NSManaged public var owner: CalendarUsers

}
