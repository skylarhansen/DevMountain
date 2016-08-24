//
//  DateHelper.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class DateHelper {
  static var calendar: NSCalendar {
    return NSCalendar.currentCalendar()
  }
  
  static var thisMorningAtMidnight: NSDate? {
    let components = calendar.components([.Month, .Day, .Year], fromDate: NSDate())
    components.second = 0
    components.minute = 0
    components.hour = 0
    components.nanosecond = 0
    return calendar.dateFromComponents(components)
  }
  
  static var tomorrowMorningAtMidnight: NSDate? {
    let components = calendar.components([.Month, .Day, .Year], fromDate: NSDate())
    components.second = 0
    components.minute = 0
    components.hour = 0
    components.nanosecond = 0
    guard let date = calendar.dateFromComponents(components) else {return nil}
    return NSDate(timeInterval: 24*60*60, sinceDate: date)
  }
}
