//
//  AlarmListTableViewController.swift
//  Alarm
//
//  Created by Jairo Eli de Leon on 8/22/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController, SwitchTableViewCellDelegate, AlarmScheduler {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
    guard let indexPath = tableView.indexPathForCell(cell) else { return }
    let alarm = AlarmController.sharedController.alarms[indexPath.row]
    
    AlarmController.sharedController.toggledEnabld(alarm)
    if alarm.enabled {
      scheduleLocalNotification(alarm)
    } else {
      cancelLocalNotification(alarm)
    }
    tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
  }
  
  // MARK: - Table view data source
  
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return AlarmController.sharedController.alarms.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("alarmCell", forIndexPath: indexPath) as? SwitchTableViewCell ?? SwitchTableViewCell()
    
    let alarm = AlarmController.sharedController.alarms[indexPath.row]
    cell.updateWithAlarm(alarm)
    cell.delegate = self
    
    return cell
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if editingStyle == .Delete {
      let alarm = AlarmController.sharedController.alarms[indexPath.row]
      AlarmController.sharedController.deleteAlarm(alarm)
      cancelLocalNotification(alarm)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "toShowDetail" {
      guard let detailVC = segue.destinationViewController as? AlarmDetailTableViewController, let selectedIndex = tableView.indexPathForSelectedRow?.row else { return }
      
      let alarm = AlarmController.sharedController.alarms[selectedIndex]
      detailVC.alarm = alarm
    }
  }
  
}














