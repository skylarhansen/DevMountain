//
//  Playlist+CoreDataProperties.swift
//  PlaylistNSUserDefaults
//
//  Created by Jairo Eli de Leon on 8/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {

    @nonobjc public override class func fetchRequest() -> NSFetchRequest {
        return NSFetchRequest(entityName: "Playlist");
    }

    @NSManaged public var name: String?
    @NSManaged public var songs: NSOrderedSet?

}

// MARK: Generated accessors for songs
extension Playlist {

    @objc(insertObject:inSongsAtIndex:)
    @NSManaged public func insertIntoSongs(value: Song, at idx: Int)

    @objc(removeObjectFromSongsAtIndex:)
    @NSManaged public func removeFromSongs(at idx: Int)

    @objc(insertSongs:atIndexes:)
    @NSManaged public func insertIntoSongs(values: [Song], at indexes: NSIndexSet)

    @objc(removeSongsAtIndexes:)
    @NSManaged public func removeFromSongs(at indexes: NSIndexSet)

    @objc(replaceObjectInSongsAtIndex:withObject:)
    @NSManaged public func replaceSongs(at idx: Int, with value: Song)

    @objc(replaceSongsAtIndexes:withSongs:)
    @NSManaged public func replaceSongs(at indexes: NSIndexSet, with values: [Song])

    @objc(addSongsObject:)
    @NSManaged public func addToSongs(value: Song)

    @objc(removeSongsObject:)
    @NSManaged public func removeFromSongs(value: Song)

    @objc(addSongs:)
    @NSManaged public func addToSongs(values: NSOrderedSet)

    @objc(removeSongs:)
    @NSManaged public func removeFromSongs(values: NSOrderedSet)

}
