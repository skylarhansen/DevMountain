//
//  EntryController.swift
//  Journal
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import Foundation

class EntryController {
  
  var entries: [Entry]
  
  static let sharedController = EntryController()
  
  init(entries: [Entry] = []){
    self.entries = entries
  }
  
  func addEntry(entry: Entry) {
    entries.append(entry)
  }
  
  func removeEntry(entry: Entry) {
    if let index = entries.index(of: entry) {
      entries.remove(at: index)
    }
  }

}
