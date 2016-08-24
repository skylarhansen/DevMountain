//
//  Entry.swift
//  Journal
//
//  Created by Jairo Eli on 10/1/15.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
  
  private let timestampKey = "timestamp"
  private let titleKey = "title"
  private let bodyTextKey = "bodyText"

  var timestamp: NSDate
  var title: String
  var bodyText: String
  
  init(timestamp: NSDate = NSDate(), title: String, bodyText: String) {
    
    self.timestamp = timestamp
    self.title = title
    self.bodyText = bodyText
  }
  
  init?(dictionary: [String: AnyObject]) {
    guard let timestamp = dictionary[timestampKey] as? NSDate, let title = dictionary[titleKey] as? String, let bodyText = dictionary[bodyTextKey] as? String else {
        return nil
    }
    
    self.title = title
    self.bodyText = bodyText
    self.timestamp = timestamp
    
  }
  
  var dictionaryCopy: [String: AnyObject] {
    return [timestampKey: self.timestamp, titleKey: self.title, bodyTextKey: self.bodyText]
  }
  
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
  return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}
