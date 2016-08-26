//
//  ListTableViewController.swift
//  Journal
//
//  Created by Jairo Eli on 08/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class EntryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntryController.sharedController.fetchedResultsController.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // What segue am I going to use?
        if segue.identifier == "toShowEntry" {
            
            // Where do I want to go?
            let destinationVC = segue.destinationViewController as? EntryDetailViewController
            
            // Get the information I need to pass
            guard let indexPath = tableView.indexPathForSelectedRow,
                entry = EntryController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Entry else { return }
            
            // Pass the information
            destinationVC?.entry = entry
        }
    }
}

// MARK: - Table view data source

extension EntryListTableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return EntryController.sharedController.fetchedResultsController.sections?.count ?? 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        guard let entry = EntryController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Entry else { return UITableViewCell() }
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            guard let entry = EntryController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Entry else { return }
            
            EntryController.sharedController.removeEntry(entry)
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let sections = EntryController.sharedController.fetchedResultsController.sections,
            index = Int(sections[section].name) else { return nil }
        
        if index == 0 {
            return "Sad"
        } else  {
            return "Happy"
        }
    }
}

// MARK: - NSFetchedResultsControllerDelegate methods

extension EntryListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
        case .Move:
            guard let indexPath = indexPath, newIndexPath = newIndexPath else { return }
            tableView.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
        case .Update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}
















