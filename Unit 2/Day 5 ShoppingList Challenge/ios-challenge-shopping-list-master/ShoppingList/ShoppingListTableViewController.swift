//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Jairo Eli de Leon on 8/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class ShoppingListTableViewController: UITableViewController, ListTableViewCellDelegate, NSFetchedResultsControllerDelegate {
  
  
  @IBAction func buttonTapped(sender: UIBarButtonItem) {
    
    var itemTextField: UITextField?
    var categoryTextField: UITextField?
    
    let alert = UIAlertController(title: "New Item", message: "What do you want to add?", preferredStyle: .Alert)
    alert.addTextFieldWithConfigurationHandler { (textField) in
      
      textField.placeholder = "Enter item"
      itemTextField = textField
    }
    
    alert.addTextFieldWithConfigurationHandler { (textField) in
      
      textField.placeholder = "Perishable/NonPerishable"
      categoryTextField = textField
      
    }
    
    let submitAction = UIAlertAction(title: "Submit", style: .Default) { (_) in
      guard let itemText = itemTextField?.text, categoryText = categoryTextField?.text else { return }
      ShoppingController.sharedController.addItem(itemText, category: categoryText)
    }
    
    let dismissAction = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
    alert.addAction(submitAction)
    alert.addAction(dismissAction)
    self.presentViewController(alert, animated: true, completion: nil)
  }
  
  func haveItemValueChanged(cell: ShoppingListTableViewCell, haveItem: Bool) {
    guard let list = cell.shopping else { return }
    ShoppingController.sharedController.haveItemValueToggled(list)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ShoppingController.sharedController.fetchedResultsController.delegate = self
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    guard let sections = ShoppingController.sharedController.fetchedResultsController.sections else { return 0 }
    return sections.count
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = ShoppingController.sharedController.fetchedResultsController.sections else { return 0 }
    return sections[section].numberOfObjects
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("shoppingCell", forIndexPath: indexPath) as? ShoppingListTableViewCell,
      let list = ShoppingController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Shopping else { return UITableViewCell() }
    
    cell.updateWithItem(list)
    cell.delegate = self
    
    return cell
  }
  
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if editingStyle == .Delete {
      guard let list = ShoppingController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Shopping else { return }
      ShoppingController.sharedController.deleteItem(list)
    }
    
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    guard let sections = ShoppingController.sharedController.fetchedResultsController.sections,
      let index = Int(sections[section].name) else { return nil }
    
    if index == 0 {
      return "Keep Cold"
    } else if index == 1 {
      return "Non Perishable"
    } else {
      return nil
    }
    
  }
  
  // MARK: - NSFetchedResultsControllerDelegate methods
  
  func controllerWillChangeContent(controller: NSFetchedResultsController) {
    tableView.beginUpdates()
  }
  
  func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    
    switch type {
    case .Delete:
      guard let indexPath = indexPath else { return }
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    
    case .Insert:
      guard let newIndexPath = newIndexPath else { return }
      tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
    
    case .Move:
      guard let indexPath = indexPath, let newIndexPath = newIndexPath else { return }
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
      tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
    
    case .Update:
      guard let indexPath = indexPath else { return }
      tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
  }
  
  func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
    
    switch type {
    case .Delete:
      tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
      
    case .Insert:
      tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
      
    default:
      break
    }
  }
  
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    tableView.endUpdates()
  }
  
  
}






