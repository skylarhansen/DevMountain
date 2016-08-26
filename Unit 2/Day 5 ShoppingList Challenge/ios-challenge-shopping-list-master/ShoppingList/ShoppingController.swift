//
//  ShoppingController.swift
//  ShoppingList
//
//  Created by Jairo Eli de Leon on 8/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingController {
  
  static let sharedController = ShoppingController()
  var fetchedResultsController = NSFetchedResultsController()
  
  init() {
    let request = NSFetchRequest(entityName: "Shopping")
    let sortDescriptor1 = NSSortDescriptor(key: "name", ascending: false)
    let sortDescriptor2 = NSSortDescriptor(key: "category", ascending: false)
    let sortDescriptor3 = NSSortDescriptor(key: "haveItem", ascending: false)
    request.sortDescriptors = [sortDescriptor1, sortDescriptor2, sortDescriptor3]
    
    self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "category", cacheName: nil)
    _ = try? fetchedResultsController.performFetch()
  }
  
  func addItem(name: String, category: String) {
    _ = Shopping(name: name, category: category)
    saveToPersistentStorage()
  }
  
  func deleteItem(shopping: Shopping) {
    shopping.managedObjectContext?.deleteObject(shopping)
    saveToPersistentStorage()
  }
  
  func updateItem(shopping: Shopping, haveItem: Bool) {
    shopping.haveItem = haveItem
    saveToPersistentStorage()
  }
  
  func haveItemValueToggled(shopping: Shopping) {
    shopping.haveItem = !shopping.haveItem.boolValue
    saveToPersistentStorage()
  }
  
  
  func saveToPersistentStorage() {
    let moc = Stack.sharedStack.managedObjectContext
    
    do {
      try moc.save()
    } catch {
      print("Error saving Managed Object Context. Items not saved.")
    }
  }
  
}
