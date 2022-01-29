//
//  ActivityTrackerApp.swift
//  ActivityTracker
//
//  Created by Srinivasan Rajendran on 2022-01-23.
//

import SwiftUI

@main
struct ActivityTrackerApp: App {

    @StateObject var dataController: DataController

    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
                           perform: save)
        }
    }

    func save(_ notif: Notification) {
        dataController.save()
    }
}
