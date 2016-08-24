//
//  Song+CoreDataProperties.swift
//  PlaylistNSUserDefaults
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Song {

    @nonobjc public override class func fetchRequest() -> NSFetchRequest {
        return NSFetchRequest(entityName: "Song");
    }

    @NSManaged public var title: String?
    @NSManaged public var artist: String?
    @NSManaged public var playlist: Playlist?

}
