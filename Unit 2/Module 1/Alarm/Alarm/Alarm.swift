//
//  Alarm.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class Alarm: Equatable {
  
  var fireTimeFromMidnight: NSTimeInterval
  var name: String
  var enabled: Bool
  let uuid: String
  
  var fireDate: NSDate? {
    guard let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else { return nil }
    let fireDateFromThisMorning = NSDate(timeInterval: fireTimeFromMidnight, sinceDate: thisMorningAtMidnight)
    return fireDateFromThisMorning
  }
  
  func timeAsString() -> String {
    let timeRemaining = Int(self.fireTimeFromMidnight ?? 20*60)
    let minutesLeft = timeRemaining / 60
    let secondsLeft = timeRemaining - (minutesLeft*60)
    return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
  }
  
  init(fireTimeFromMidnight: NSTimeInterval, name: String, enabled: Bool = true, uuid: String = NSUUID().UUIDString) {
    self.fireTimeFromMidnight = fireTimeFromMidnight
    self.name = name
    self.enabled = enabled
    self.uuid = uuid
  }
  
}

func ==(lhs: Alarm, rhs: Alarm) -> Bool {
  return lhs.fireTimeFromMidnight == rhs.fireTimeFromMidnight && lhs.name == rhs.name && lhs.enabled == rhs.enabled && lhs.uuid == rhs.uuid
}
