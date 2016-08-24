//
//  DetailViewController.swift
//  Notes
//
//  Created by Jairo Eli de Leon on 8/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textView: UITextView!
  
  var note: Note?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let note = note {
      updateWith(note)
    }
  }
  
  @IBAction func saveButtonTapped(sender: AnyObject) {
    if let note = self.note, let text = self.textView.text {
      note.text = text
      note.timestamp = NSDate()
    } else {
      
      if let text = self.textView.text {
        let newNote = Note(text: text)
        NoteController.sharedController.addEntry(newNote)
        self.note = newNote
      }
      self.navigationController?.popViewControllerAnimated(true)
    }
  }
  
  func updateWith(note: Note) {
    self.note = note
    self.textView.text = note.text
  }
  
  // MARK: Text Field
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  
}
