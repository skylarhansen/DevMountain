//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Jairo Eli de Leon on 8/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return NoteController.sharedController.notes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("notesCell", forIndexPath: indexPath)
    let note = NoteController.sharedController.notes[indexPath.row]
    cell.textLabel?.text = note.text
    
    // Configure the cell...
    return cell
  }
  
  
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if editingStyle == .Delete {
      let note = NoteController.sharedController.notes[indexPath.row]
      NoteController.sharedController.removeNote(note)
      // Delete the row from the data source
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
  }
  
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "toShowNote" {
      
      if let detailVC = segue.destinationViewController as? DetailViewController, let selectedIndex = tableView.indexPathForSelectedRow?.row {
        let note = NoteController.sharedController.notes[selectedIndex]
        detailVC.note = note
      }
    }
  }
  
  
}
