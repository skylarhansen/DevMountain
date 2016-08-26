//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jairo Eli on 08/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let title = titleTextField.text,
            text = bodyTextView.text else {return}
        let isHappy = moodSegmentedControl.selectedSegmentIndex == 0 ? true:false
        if let entry = self.entry {
            EntryController.sharedController.updateEntry(entry, title: title, text: text, isHappy: isHappy)
        } else {
            EntryController.sharedController.addEntry(title, text: text, isHappy: isHappy)
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
        self.bodyTextView.text = entry.text
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
