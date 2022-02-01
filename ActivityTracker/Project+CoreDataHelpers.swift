//
//  Project+CoreDataHelpers.swift
//  ActivityTracker
//
//  Created by Srinivasan Rajendran on 2022-01-26.
//

import Foundation

extension Project {

    static let colors = ["Pink", "Purple", "Red", "Orange", "Gold", "Green", "Teal", "Light Blue", "Dark Blue", "Midnight", "Dark Gray", "Gray"]

    var projectTitle: String {
        title ?? "New Project"
    }

    var projectDetail: String {
        detail ?? ""
    }

    var projectColor: String {
        color ?? "Light Blue"
    }

    var projectItems: [Item] {
        items?.allObjects as? [Item] ?? []
    }

    var projectItemsDefaultSorted: [Item] {
        return projectItems.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }

            if first.priority > second.priority {
                return true
            } else if first.priority < second.priority {
                return false
            }

            return first.itemCreationDate < second.itemCreationDate
        }
    }


    func projectItems(using sortOrder: Item.SortOrder) -> [Item] {
        switch sortOrder {
        case .title:
            return projectItems.sorted(by: \.itemTitle)
        case .creationDate:
            return projectItems.sorted(by: \.itemCreationDate)
        case .optimized:
            return projectItemsDefaultSorted
        }
    }

    var completionAmount: Double {
        let originalItems = projectItems
        guard originalItems.isEmpty == false else { return 0 }

        let completedItems = originalItems.filter(\.completed)
        return Double(completedItems.count)/Double(originalItems.count)
    }

    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is an example project"
        project.closed = true
        project.creationDate = Date()

        return project
    }
}
