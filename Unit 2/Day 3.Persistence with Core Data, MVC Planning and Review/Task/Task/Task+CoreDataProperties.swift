//
//  Task+CoreDataProperties.swift
//  Task
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//

import Foundation
import CoreData

extension Task {

    @NSManaged var due: NSDate?
    @NSManaged var isComplete: NSNumber
    @NSManaged var name: String
    @NSManaged var notes: String?

}
