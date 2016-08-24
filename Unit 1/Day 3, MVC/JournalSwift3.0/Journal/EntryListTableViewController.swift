//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Jairo Eli de Leon on 8/17/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    self.tableView.reloadData()
  }

  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return EntryController.sharedController.entries.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
    
    let entry = EntryController.sharedController.entries[indexPath.row]
    
    cell.textLabel?.text = entry.title
    
    return cell
  }
  
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      let entry = EntryController.sharedController.entries[indexPath.row]
        EntryController.sharedController.removeEntry(entry: entry)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
  }

   // MARK: - Navigation
  
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "showEntryDetail" {
      
      if let entryDVC = segue.destination as? EntryDetailViewController, let indexPath = tableView.indexPathForSelectedRow?.row {
        
        let entry = EntryController.sharedController.entries[indexPath]
        entryDVC.entry = entry
      }
    }
  }

}
