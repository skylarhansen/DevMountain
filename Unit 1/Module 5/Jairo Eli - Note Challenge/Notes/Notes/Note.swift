//
//  Note.swift
//  Notes
//
//  Created by Jairo Eli de Leon on 8/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
  
  private let timeStampKey = "timestamp"
  private let textKey = "text"
  
  var text: String
  var timestamp: NSDate
  
  init(text: String, timestamp: NSDate = NSDate()) {
    self.text = text
    self.timestamp = timestamp
  }
  
  init?(dictionary: [String: AnyObject]) {
    guard let timestamp = dictionary[timeStampKey] as? NSDate, let text = dictionary[textKey] as? String else {
      return nil
    }
    self.timestamp = timestamp
    self.text = text
  }
  
  var dictionaryCopy: [String: AnyObject] {
    return [timeStampKey: self.timestamp, textKey: self.text]
  }
  
}

func ==(lhs: Note, rhs: Note) -> Bool {
  return lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
}
