//
//  mochiApp.swift
//  mochi
//
//  Created by Angus Jelinek on 2/5/22.
//

import SwiftUI

@main
struct mochiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
