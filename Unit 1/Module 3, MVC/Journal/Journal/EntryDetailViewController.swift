//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jairo Eli on 10/3/15.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var bodyTextView: UITextView!
  
  var entry: Entry?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let entry = entry {
      updateWithEntry(entry)
    }
  }
  
  @IBAction func saveButtonTapped(sender: AnyObject) {
    
    if let entry = self.entry {
      entry.title = self.titleTextField.text!
      entry.bodyText = self.bodyTextView.text
      entry.timestamp = NSDate()
    } else {
      let newEntry = Entry(title: self.titleTextField.text!, text: self.bodyTextView.text)
      EntryController.sharedController.addEntry(newEntry)
      self.entry = newEntry
    }
    
    self.navigationController?.popViewControllerAnimated(true)
  }
  
  @IBAction func clearButtonTapped(sender: AnyObject) {
    
    titleTextField.text = ""
    bodyTextView.text = ""
  }
  
  func updateWithEntry(entry: Entry) {
    self.entry = entry
    
    self.titleTextField.text = entry.title
    self.bodyTextView.text = entry.bodyText
  }
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
