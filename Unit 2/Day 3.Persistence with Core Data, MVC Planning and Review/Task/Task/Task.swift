//
//  Task.swift
//  Task
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

@objc(Task)
class Task: NSManagedObject {
  
  convenience init(name: String, notes: String? = nil, due: NSDate? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
    
    // designated initializer
    let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
    
    self.init(entity: entity, insertIntoManagedObjectContext: context)
    
    // set properties
    self.name = name
    self.notes = notes
    self.due = due
    self.isComplete = false
    
  }

}
