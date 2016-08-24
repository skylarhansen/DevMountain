//
//  ListTableViewController.swift
//  Journal
//
//  Created by Jairo Eli on 10/3/15.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return EntryController.sharedController.entries.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
    
    let entry = EntryController.sharedController.entries[indexPath.row]
    
    cell.textLabel?.text = entry.title
    
    return cell
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      
      let entry = EntryController.sharedController.entries[indexPath.row]
      EntryController.sharedController.removeEntry(entry)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "toShowEntry" {
      
      if let detailViewController = segue.destinationViewController as? EntryDetailViewController,
        let selectedIndex = tableView.indexPathForSelectedRow?.row {
        
        let entry = EntryController.sharedController.entries[selectedIndex]
        detailViewController.entry = entry
      }
    }
  }
  
  
}
