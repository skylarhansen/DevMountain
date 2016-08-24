//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
  
  var entry: Entry?
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var bodyTextField: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let entry = self.entry {
      updateWithEntry(entry: entry)
    }
  }
  
  func updateWithEntry(entry: Entry) {
    self.entry = entry
    self.textField.text = entry.title
    self.bodyTextField.text = entry.bodyText
  }
  
  
  @IBAction func saveButtonTapped(_ sender: AnyObject) {
    
    if let entry = self.entry, let textfields = self.textField.text {
      entry.title = textfields
      entry.bodyText = self.bodyTextField.text
      entry.timestamp = Date()
    } else {
      let newEntry = Entry(title: self.textField.text!, bodyText: self.bodyTextField.text)
      EntryController.sharedController.addEntry(entry: newEntry)
      self.entry = newEntry
    }
    
    self.navigationController?.popViewController(animated: true)
    
  }
  
  
  @IBAction func clearButtonTapped(_ sender: AnyObject) {
    bodyTextField.text = ""
    textField.text = ""
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
