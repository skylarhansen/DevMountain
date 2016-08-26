//
//  Shopping+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Jairo Eli de Leon on 8/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Shopping {

    @NSManaged var name: String
    @NSManaged var category: String
    @NSManaged var haveItem: Bool

}
