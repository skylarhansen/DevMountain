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
  var alarms: [Alarm]
  
  init() {
    self.alarms = []
  }
  
  func addAlarm(fireTimeFromMidnight: NSTimeInterval, name: String) -> Alarm {
    let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
    alarms.append(alarm)
    return alarm
  }
  
  func updateAlarm(alarm: Alarm, fireTimeFromMidnight: NSTimeInterval, name: String) {
    alarm.fireTimeFromMidnight = fireTimeFromMidnight
    alarm.name = name
  }
  
  func deleteAlarm(alarm: Alarm) {
    guard let index = alarms.indexOf(alarm) else { return }
    alarms.removeAtIndex(index)
  }
  
  func toggledEnabld(alarm: Alarm) {
    alarm.enabled = !alarm.enabled
  }
  
}
