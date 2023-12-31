//
//  FitBizApp.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 19.11.2023.
//

import SwiftUI
import SwiftData

@main
struct FitBizApp: App {
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Client.self
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
                .modelContainer(sharedModelContainer)
        }
    }
}
