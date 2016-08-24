//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return TaskController.sharedController.incompleteTasks.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
    
    let task = TaskController.sharedController.incompleteTasks[indexPath.row]
    
    cell.updateWithTask(task)
    cell.delegate = self
    return cell
  }
  
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if editingStyle == .Delete {
      let task = TaskController.sharedController.incompleteTasks[indexPath.row]
      TaskController.sharedController.removeTask(task)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
  }
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "toShowDetail" {
      
      if let detailVC = segue.destinationViewController as? TaskDetailTableViewController, let selectedIndex = tableView.indexPathForSelectedRow?.row {
        
        let task = TaskController.sharedController.tasks[selectedIndex]
        detailVC.task = task
      }
    }
  }
  
}

  // MARK: - ButtonTableViewCellDelegate
extension TaskListTableViewController: ButtonTableViewCellDelegate {
  
  func buttonCellButtonTapped(sender: ButtonTableViewCell) {
    
    let indexPath = tableView.indexPathForCell(sender)!
    
    let task = TaskController.sharedController.incompleteTasks[indexPath.row]
    TaskController.sharedController.isCompleteValueToggle(task)
    tableView.reloadData()
    
  }
}
