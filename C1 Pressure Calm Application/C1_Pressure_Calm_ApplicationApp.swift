//
//  C1_Pressure_Calm_ApplicationApp.swift
//  C1 Pressure Calm Application
//
//  Created by Jeany Aurellia on 18/05/26.
//

import SwiftUI
import SwiftData

@main
struct C1_Pressure_Calm_ApplicationApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
