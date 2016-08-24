//
//  Alarm.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class Alarm: NSObject, NSCoding {
  
  private let kName = "name"
  private let kEnabled = "enabled"
  private let kUUID = "UUID"
  private let kFireTimeFromMidnight = "fireTimeFromMidnight"
  
  var fireTimeFromMidnight: NSTimeInterval
  var name: String
  var enabled: Bool
  let uuid: String
  
  var fireDate: NSDate? {
    guard let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else { return nil }
    let fireDateFromThisMorning = NSDate(timeInterval: fireTimeFromMidnight, sinceDate: thisMorningAtMidnight)
    return fireDateFromThisMorning
  }
  
  var fireTimeAsString: String {
    let fireTimeFromMidnight = Int(self.fireTimeFromMidnight)
    var hours = fireTimeFromMidnight/60/60
    let minutes = (fireTimeFromMidnight - (hours*60*60))/60
    if hours >= 13 {
      return String(format: "%2d:%02d PM", arguments: [hours - 12, minutes])
    } else if hours >= 12 {
      return String(format: "%2d:%02d PM", arguments: [hours, minutes])
    } else {
      if hours == 0 {
        hours = 12
      }
      return String(format: "%2d:%02d AM", arguments: [hours, minutes])
    }
  }
  
  init(fireTimeFromMidnight: NSTimeInterval, name: String, enabled: Bool = true, uuid: String = NSUUID().UUIDString) {
    self.fireTimeFromMidnight = fireTimeFromMidnight
    self.name = name
    self.enabled = enabled
    self.uuid = uuid
  }
  
  required init?(coder aDecoder: NSCoder) {
    guard let fireTimeFromMidnight = aDecoder.decodeObjectForKey(kFireTimeFromMidnight) as? NSTimeInterval,
    let name = aDecoder.decodeObjectForKey(kName) as? String,
    let enabled = aDecoder.decodeObjectForKey(kEnabled) as? Bool,
    let uuid = aDecoder.decodeObjectForKey(kUUID) as? String else { return nil }
    
    self.fireTimeFromMidnight = fireTimeFromMidnight
    self.name = name
    self.enabled = enabled
    self.uuid = uuid
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(fireTimeFromMidnight, forKey: kFireTimeFromMidnight)
    aCoder.encodeObject(name, forKey: kName)
    aCoder.encodeObject(enabled, forKey: kEnabled)
    aCoder.encodeObject(uuid, forKey: kUUID)
  }
  
}

func ==(lhs: Alarm, rhs: Alarm) -> Bool {
  return lhs.fireTimeFromMidnight == rhs.fireTimeFromMidnight && lhs.name == rhs.name && lhs.enabled == rhs.enabled && lhs.uuid == rhs.uuid
}
