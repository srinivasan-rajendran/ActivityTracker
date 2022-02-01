//
//  Item+CoreDataHelpers.swift
//  ActivityTracker
//
//  Created by Srinivasan Rajendran on 2022-01-26.
//

import Foundation

extension Item {
    var itemTitle: String {
        title ?? "New Item"
    }

    var itemDetail: String {
        detail ?? ""
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }

    static var example: Item {
        let controller = DataController.init(inMemory: true)
        let viewContext = controller.container.viewContext

        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example item"
        item.priority = 3
        item.creationDate = Date()

        return item
    }
}
