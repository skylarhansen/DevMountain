//
//  Entry.swift
//  Journal
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class Entry: Equatable {
  
  var timestamp: Date
  var title: String
  var bodyText: String
  
  init(timestamp: Date = Date(), title: String, bodyText: String) {
    self.timestamp = timestamp
    self.title = title
    self.bodyText = bodyText
  }
  
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
  
  return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
  
}
