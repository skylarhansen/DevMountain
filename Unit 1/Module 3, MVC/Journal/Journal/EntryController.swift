//
//  EntryController.swift
//  Journal
//
//  Created by Jairo Eli on 10/1/15.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
  
  private let entriesKey = "entries"
  
  static let sharedController = EntryController()
  
  var entries: [Entry]
  
  init() {
    self.entries = []
  }
  
  func addEntry(entry: Entry) {
    entries.append(entry)
  }
  
  func removeEntry(entry: Entry) {
    if let entryIndex = entries.indexOf(entry) {
      entries.removeAtIndex(entryIndex)
    }
  }
  
  
}
