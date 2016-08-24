//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController, AlarmScheduler {
  
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
    guard let alarm = alarm else {return}
    AlarmController.sharedController.toggledEnabld(alarm)
    if alarm.enabled {
      scheduleLocalNotification(alarm)
    } else {
      cancelLocalNotification(alarm)
    }
    setupView()
  }
  
  @IBAction func saveButtonTapped(sender: AnyObject) {
    guard let title = nameLabel.text,
      let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else {return}
    let timeIntervalSinceMidnight = datePicker.date.timeIntervalSinceDate(thisMorningAtMidnight)
    
    if let alarm = alarm {
      AlarmController.sharedController.updateAlarm(alarm, fireTimeFromMidnight: timeIntervalSinceMidnight, name: title)
      cancelLocalNotification(alarm)
      scheduleLocalNotification(alarm)
    } else {
      let alarm = AlarmController.sharedController.addAlarm(timeIntervalSinceMidnight, name: title)
      self.alarm = alarm
      scheduleLocalNotification(alarm)
    }
    self.navigationController?.popViewControllerAnimated(true)
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
