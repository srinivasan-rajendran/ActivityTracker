//
//  ProjectTests.swift
//  ActivityTrackerTests
//
//  Created by Srinivasan Rajendran on 2022-02-18.
//

import XCTest
import CoreData
@testable import ActivityTracker

class ProjectTests: BaseTestCase {

    func testCreatingProjectsAndItems() {
        let targetCount = 10

        for _ in 0..<targetCount {
            let project = Project(context: managedObjectContext)

            for _ in 0..<targetCount {
                let item = Item(context: managedObjectContext)
                item.project = project
            }
        }

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), targetCount)
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), targetCount * targetCount)
    }

    func testDeletingProjectCascadeDeletesItems() throws {
        try dataController.createSampleData()

        let request = NSFetchRequest<Project>(entityName: Project.entity().name!)
        let projects = try managedObjectContext.fetch(request)

        let projetsCountBeforeDelete = dataController.count(for: Project.fetchRequest())
        let itemsCountBeforeDelete = dataController.count(for: Item.fetchRequest())

        let testDeleteProject = projects[0]
        let itemsCountInTestDeleteProject = testDeleteProject.projectItems.count

        dataController.delete(projects[0])

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), projetsCountBeforeDelete - 1)
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), itemsCountBeforeDelete - itemsCountInTestDeleteProject)
    }

}
