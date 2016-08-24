//
//  AlarmController.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation
import UIKit

class AlarmController {
  
  static let sharedController = AlarmController()
  private let kAlarms = "alarms"
  var alarms: [Alarm]
  
  init() {
    self.alarms = []
    loadFromPersistentStorage()
  }
  
  func addAlarm(fireTimeFromMidnight: NSTimeInterval, name: String) -> Alarm {
    let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
    alarms.append(alarm)
    saveToPersistentStorage()
    return alarm
  }
  
  func updateAlarm(alarm: Alarm, fireTimeFromMidnight: NSTimeInterval, name: String) {
    alarm.fireTimeFromMidnight = fireTimeFromMidnight
    alarm.name = name
    saveToPersistentStorage()
  }
  
  func deleteAlarm(alarm: Alarm) {
    guard let index = alarms.indexOf(alarm) else { return }
    alarms.removeAtIndex(index)
    saveToPersistentStorage()
  }
  
  func toggledEnabld(alarm: Alarm) {
    alarm.enabled = !alarm.enabled
    saveToPersistentStorage()
  }
  
  func saveToPersistentStorage() {
    NSKeyedArchiver.archiveRootObject(self.alarms, toFile: filePath(kAlarms))
  }
  
  func loadFromPersistentStorage() {
    guard let alarms = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath(kAlarms)) as? [Alarm] else { return }
    self.alarms = alarms
  }
  
  func filePath(key: String) -> String {
    let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
    let documentsPath: AnyObject = directorySearchResults[0]
    let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
    
    return entriesPath
  }
  
}

protocol AlarmScheduler {
  func scheduleLocalNotification(alarm: Alarm)
  func cancelLocalNotification(alarm: Alarm)
}

extension AlarmScheduler {
  func scheduleLocalNotification(alarm: Alarm) {
    let localNotification = UILocalNotification()
    localNotification.alertTitle = "Time's up!"
    localNotification.alertBody = "Your alarm titled \(alarm.name) is done"
    localNotification.fireDate = alarm.fireDate
    localNotification.category = alarm.uuid
    localNotification.repeatInterval = .Day
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
  }
  
  
  func cancelLocalNotification(alarm: Alarm) {
    guard let scheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else { return }
    
    for notification in scheduledNotifications {
      if notification.category ?? "" == alarm.uuid {
        UIApplication.sharedApplication().cancelLocalNotification(notification)
      }
    }
  }
  
}
