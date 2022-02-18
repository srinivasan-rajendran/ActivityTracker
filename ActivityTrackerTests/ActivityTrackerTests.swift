//
//  ActivityTrackerTests.swift
//  ActivityTrackerTests
//
//  Created by Srinivasan Rajendran on 2022-02-18.
//

import XCTest
import CoreData
@testable import ActivityTracker

class BaseTestCase: XCTestCase {

    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }


}
