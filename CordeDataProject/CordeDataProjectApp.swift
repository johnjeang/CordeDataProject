//
//  CordeDataProjectApp.swift
//  CordeDataProject
//
//  Created by John Jeang on 6/29/21.
//

import SwiftUI

@main
struct CordeDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
