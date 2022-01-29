//
//  ProjectsView.swift
//  ActivityTracker
//
//  Created by Srinivasan Rajendran on 2022-01-25.
//

import SwiftUI

struct ProjectsView: View {
    static let openTag: String? = "Open"
    static let closedTag: String? = "Closed"

    let showClosedProjects: Bool
    let projects: FetchRequest<Project>

    init(showClosedProjects: Bool) {
        self.showClosedProjects = showClosedProjects
        projects = FetchRequest<Project>(entity: Project.entity(),
                                         sortDescriptors: [
                                            NSSortDescriptor(keyPath: \Project.creationDate,
                                                             ascending: false)
                                         ],
                                         predicate: NSPredicate(format: "closed = %d", showClosedProjects)
                                        )
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(projects.wrappedValue) { project in
                    Section {
                        ForEach(project.projectItems) { item in
                            ItemRowView(item: item)
                        }
                    } header: {
                        Text(project.projectTitle)
                    }

                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showClosedProjects ? "ClosedProjects" : "Open Projects")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {

    static var dataController = DataController.preview

    static var previews: some View {
        ProjectsView(showClosedProjects: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
