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
  private let textKey = "text"
  
  var timestamp: NSDate
  var title: String
  var bodyText: String
  
  init(timestamp: NSDate = NSDate(), title: String, text: String) {
    
    self.timestamp = timestamp
    self.title = title
    self.bodyText = text
  }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
  return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}
