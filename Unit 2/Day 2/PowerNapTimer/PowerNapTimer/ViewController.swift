//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TimerDelegate {
  
  @IBOutlet weak var timerLabel: UILabel!
  
  @IBOutlet weak var startButton: UIButton!
  
  let timer = Timer()
  private let localNotificationTag = "timerNotification"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    timer.delegate = self
    restTimer()
    setView()
  }
  
  func setView() {
    updateTimerLabel()
    // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
    if timer.isOn {
      startButton.setTitle("Cancel", forState: .Normal)
    } else {
      startButton.setTitle("Start nap", forState: .Normal)
    }
  }
  
  func updateTimerLabel() {
    timerLabel.text = timer.timeAsString()
  }
  
  
  
  @IBAction func startButtonTapped(sender: AnyObject) {
    if timer.isOn {
      timer.stopTimer()
    } else {
      timer.startTimer(10)
      scheduleNotification()
    }
    setView()
  }
  
  // MARK: TimerDelegate Functions
  
  func timerSecondTick() {
    updateTimerLabel()
  }
  
  func timerCompleted() {
    let alertController = UIAlertController(title: "Wake up!", message: "Time to get back to work", preferredStyle: .Alert)
    
    var snoozeTextField: UITextField?
    
    alertController.addTextFieldWithConfigurationHandler { (textField) in
      textField.placeholder = "Snooze time"
      textField.keyboardType = .NumberPad
      snoozeTextField = textField
    }
    
    let dismissAction = UIAlertAction(title: "Dismiss", style: .Cancel) { (_) in
      self.setView()
    }
    
    let snoozeAction = UIAlertAction(title: "Snooze", style: .Default) { (_) in
      guard let timeText = snoozeTextField?.text, let time = NSTimeInterval(timeText) else { return }
      self.timer.startTimer(time*60)
      self.setView()
      self.scheduleNotification()
    }
    
    alertController.addAction(dismissAction)
    alertController.addAction(snoozeAction)
    presentViewController(alertController, animated: true, completion: nil)
  }
  
  func timerStopped() {
    setView()
    cancelLocalNotifications()
  }
  
  // MARK: Local Notifications
  func scheduleNotification() {
    guard let timerTime = timer.timeRemaining else { return }
    let localNotification = UILocalNotification()
    localNotification.alertBody = "It's time to wake up!"
    localNotification.category = localNotificationTag
    localNotification.fireDate = NSDate(timeIntervalSinceNow: timerTime)
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
  }
  
  func cancelLocalNotifications() {
    UIApplication.sharedApplication().cancelAllLocalNotifications()
  }
  
  func restTimer() {
    guard let localNotfications = UIApplication.sharedApplication().scheduledLocalNotifications else { return }
    
    let timerLocalNotifications = localNotfications.filter({$0.category == localNotificationTag})
    
    guard let timerNotification = timerLocalNotifications.last, let fireDate = timerNotification.fireDate else { return }
    
    timer.stopTimer()
    timer.startTimer(fireDate.timeIntervalSinceNow)
  }
  
}

