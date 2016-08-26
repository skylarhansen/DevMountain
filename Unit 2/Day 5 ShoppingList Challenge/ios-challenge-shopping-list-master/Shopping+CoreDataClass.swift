//
//  Shopping+CoreDataClass.swift
//  ShoppingList
//
//  Created by Jairo Eli de Leon on 8/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Shopping: NSManagedObject {
  
  convenience init?(name: String, haveItem: Bool = false, category: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
    
    guard let entity = NSEntityDescription.entityForName("Shopping", inManagedObjectContext: context) else { return nil }
    
    self.init(entity: entity, insertIntoManagedObjectContext: context)
    
    self.name = name
    self.haveItem = haveItem
    self.category = category
    
  }
  

}
