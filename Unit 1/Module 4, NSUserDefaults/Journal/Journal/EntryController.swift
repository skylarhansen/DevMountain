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
    loadFromPersistentStorage()
  }
  
  func addEntry(entry: Entry) {
    entries.append(entry)
    self.saveToPersistentStorage()
  }
  
  func removeEntry(entry: Entry) {
    if let entryIndex = entries.indexOf(entry) {
      entries.removeAtIndex(entryIndex)
      self.saveToPersistentStorage()
    }
    
  }
  
  func saveToPersistentStorage() {
    
    let entryDictionaries = self.entries.map({$0.dictionaryCopy})
    NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
    
  }
  
  func loadFromPersistentStorage() {
    
    guard let dictionaryFromPersist = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [[String: AnyObject]] else {return}
    
    // now we have the whole list of all entries in a dictionary. Now we loop over them and create our entries array with new Entry objects
    
    entries = dictionaryFromPersist.flatMap({Entry(dictionary: $0)})
  }
  
  
}
