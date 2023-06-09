//
//  AppApp.swift
//  App
//
//  Created by Pedro Rodrigues on 09/06/23.
//

import SwiftUI
import Core_Providers

@main
struct AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
