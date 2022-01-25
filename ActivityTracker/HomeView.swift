//
//  HomeView.swift
//  ActivityTracker
//
//  Created by Srinivasan Rajendran on 2022-01-25.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var dataController: DataController

    var body: some View {
        NavigationView {
            VStack {
                Button("Add Data") {
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
