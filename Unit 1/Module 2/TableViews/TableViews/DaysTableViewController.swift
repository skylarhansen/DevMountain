//
//  DaysTableViewController.swift
//  TableViews
//
//  Created by Jairo Eli de Leon on 8/16/16.
//  Copyright © 2016 Jairo Eli. All rights reserved.
//

import UIKit

class DaysTableViewController: UITableViewController {
  
  let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday", "Sunday"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return daysOfWeek.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
    cell.textLabel?.text = daysOfWeek[indexPath.row]
    
    return cell
  }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toDetailView" {
      
      if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
        let detailVC = segue.destination as? DayDetailViewController
        
        detailVC?.day = daysOfWeek[indexPath.row]
      }
    }
   }

  
}
























