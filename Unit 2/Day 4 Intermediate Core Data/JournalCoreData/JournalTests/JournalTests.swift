//
//  JournalTests.swift
//  JournalTests
//
//  Created by Jairo Eli on 08/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import XCTest
@testable import Journal

class JournalTests: XCTestCase {
    
    private let testTitle = "Test Title"
    private let testBodyText = "Lorem ipsum doler init."
    
    let controller = EntryController.sharedController
    
    override func setUp() {
        
        super.setUp()
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        // Resets persisted entries
        controller.entries = []
        
        // MARK: Part 3
        controller.saveToPersistentStorage()
    }
    
    // MARK: Part 1
    
    func testEntryMemberwiseInitializer() {
        
        let testEntry = Entry(entity: testTitle, insertIntoManagedObjectContext: testBodyText)

        XCTAssert(testEntry.title == testTitle && testEntry.text == testBodyText, "Entry title or text do not match values passed at initialization.")
    }
    
    func testSharedInstance() {
        XCTAssertNotNil(EntryController.sharedController)
    }
    
    func testEntryControllerAddEntry() {
        
        let testEntry = Entry(entity: testTitle, insertIntoManagedObjectContext: testBodyText)
        
        controller.addEntry(testEntry)
        
        XCTAssert(controller.entries.contains(testEntry), "Entry object not added to EntryController's entries array.")
    }
    
    func testEntryControllerRemoveEntry() {
        
        let controller = EntryController.sharedController
        
        let testEntry = Entry(entity: testTitle, insertIntoManagedObjectContext: testBodyText)
        
        controller.addEntry(testEntry)
        
        XCTAssert(controller.entries.contains(testEntry), "Entry object not added to EntryController's entries array.")
        
        controller.removeEntry(testEntry)
        
        XCTAssertFalse(controller.entries.contains(testEntry), "Entry object still contained in EntryController's entries array.")
    }
    
    // MARK: Part 3
    
    func testEntryPersistence() {
        let controller = EntryController.sharedController
        
        let testEntry = Entry(entity: "Test Title", insertIntoManagedObjectContext: "Lorem ipsum doler init")
        
        controller.addEntry(testEntry)
        
        XCTAssert(controller.entries.contains(testEntry), "Entry object not added to EntryController's entries array.")
        
        controller.entries = []
        
        controller.loadFromPersistentStorage()
        
        if let restoredEntry = controller.entries.last {
            
            XCTAssert(restoredEntry.title == testEntry.title && restoredEntry.text == testEntry.text, "Entry object unsuccessfully loaded from NSUserDefaults.")
        }
        
        controller.removeEntry(testEntry)
    }
    
}
