//
//  ShiftAppApp.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

@main
struct ShiftAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
