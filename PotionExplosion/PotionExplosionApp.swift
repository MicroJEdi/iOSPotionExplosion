//
//  PotionExplosionApp.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

@main
struct PotionExplosionApp: App {
    
    var sharedModelContainer: ModelContainer = {
        do {
            return try ModelContainer.createAppModelContiner()
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
