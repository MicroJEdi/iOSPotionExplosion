//
//  ModelContainerSetup.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import Foundation
import SwiftData

extension ModelContainer {
    
    static let schema = Schema([
        Item.self,
    ])
    
    static func createAppModelContiner() throws -> ModelContainer {
        do {
            return try ModelContainer(for: ModelContainer.schema, configurations: [ModelConfiguration(schema: ModelContainer.schema, isStoredInMemoryOnly: false)])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    static var sample: () throws -> ModelContainer = {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [configuration])
        Task { @MainActor in
            Item.insertSampleData(modelContext: container.mainContext)
        }
        return container
    }
}
