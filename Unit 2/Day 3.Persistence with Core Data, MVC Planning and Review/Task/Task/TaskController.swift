//
//  TaskController.swift
//  Task
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
  
  static let sharedController = TaskController()
  
//  var mockTasks:[Task] {
//    let sampleTask1 = Task(name: "Go grocery shopping", notes: "HEB")
//    let sampleTask2 = Task(name: "Pay loan", notes: "341 S. Main St. Salt Lake City, UT 84111", due: NSDate(timeIntervalSinceNow: NSTimeInterval(60*60*24*3)))
//    let sampleTask3 = Task(name: "Studying Swift")
//    let sampleTask4 = Task(name: "Buy an iPhone 7", notes: "Check out upgrade eligibility")
//    sampleTask4.isComplete = true
//    
//    return [sampleTask1, sampleTask2, sampleTask3, sampleTask4]
//  }
  
  let fetchedResultsController: NSFetchedResultsController
  
  init() {
    // Initialize Fetch Request
    let request = NSFetchRequest(entityName: "Task")
    // Add Sort Descriptors
    let completedSortDescriptor = NSSortDescriptor(key: "isComplete", ascending: true)
    let dueSortDescriptor = NSSortDescriptor(key: "due", ascending: true)
    request.sortDescriptors = [completedSortDescriptor, dueSortDescriptor]
    // Initialize Fetched Results Controller
    self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
    
    do {
      try fetchedResultsController.performFetch()
    } catch let error as NSError {
      print("Unable to peform fetch request: \(error.localizedDescription)")
    }
  }
  
  func addTask(name: String, notes: String?, due: NSDate?) {
    let _ = Task(name: name, notes: notes, due: due)
    saveToPersistentStorage()
  }
  
  func updateTask(task: Task, name: String, notes: String?, due: NSDate?) {
    task.name = name
    task.notes = notes
    task.due = due
    saveToPersistentStorage()
  }
  
  func removeTask(task: Task) {
    task.managedObjectContext?.deleteObject(task)
    saveToPersistentStorage()
  }
  
  func isCompleteValueToggle(task: Task) {
    task.isComplete = !task.isComplete.boolValue
    saveToPersistentStorage()
  }
  
  // MARK: - Persistence
  
  func saveToPersistentStorage() {
    
    do {
      try Stack.sharedStack.managedObjectContext.save()
    } catch {
      print("Error saving Managed Object Context. Items not saved.")
    }
  }
  
  
}



