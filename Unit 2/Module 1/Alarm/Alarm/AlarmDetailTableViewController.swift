//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
  
  var alarm: Alarm?
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var nameLabel: UITextField!
  @IBOutlet weak var disableButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let alarm = alarm {
      updateWithAlarm(alarm)
    }
    setupView()
  }
  
  @IBAction func enableButtonTapped(sender: AnyObject) {
  }
  
  @IBAction func saveButtonTapped(sender: AnyObject) {
  }
  
  func updateWithAlarm(alarm: Alarm) {
    guard let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else { return }
    datePicker.setDate(NSDate(timeInterval: alarm.fireTimeFromMidnight, sinceDate: thisMorningAtMidnight), animated: false)
    nameLabel.text = alarm.name
    self.title = alarm.name
  }
  
  func setupView() {
    if alarm == nil {
      disableButton.hidden = true
    } else {
      disableButton.hidden = false
      if alarm?.enabled == true {
        disableButton.setTitle("Disable", forState: .Normal)
        disableButton.setTitleColor(.whiteColor(), forState: .Normal)
        disableButton.backgroundColor = .redColor()
      } else {
        disableButton.setTitle("Enable", forState: .Normal)
        disableButton.setTitleColor(.blueColor(), forState: .Normal)
        disableButton.backgroundColor = .grayColor()
      }
    }
  }
  
  
  
}
