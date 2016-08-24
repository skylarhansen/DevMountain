//
//  NoteController.swift
//  Notes
//
//  Created by Jairo Eli de Leon on 8/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
  
  private let notesKey = "notes"
  static let sharedController = NoteController()
  var notes: [Note]
  
  init() {
    self.notes = []
    self.loadFromPersistent()
  }
  
  func addEntry(note: Note) {
    notes.append(note)
    self.saveToPersistent()
  }
  
  func removeNote(note: Note) {
    if let noteIndex = notes.indexOf(note) {
      notes.removeAtIndex(noteIndex)
      self.saveToPersistent()
    }
  }
  
  func loadFromPersistent() {
    guard let dictionaryFromPersist = NSUserDefaults.standardUserDefaults().objectForKey(notesKey) as? [[String: AnyObject]] else { return }
    notes = dictionaryFromPersist.flatMap({Note(dictionary: $0)})
  }
  
  func saveToPersistent() {
    let noteDictionaries = self.notes.map({$0.dictionaryCopy})
    NSUserDefaults.standardUserDefaults().setObject(noteDictionaries, forKey: notesKey)
  }
  
  
}
