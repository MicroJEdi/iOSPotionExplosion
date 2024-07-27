//
//  ItemDataExtension.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import Foundation
import SwiftData

extension Item: PopulateSampleDataProtocol {
    
    static var sampleItems: [ Item ] = [ Item(timestamp: Date.now), Item(timestamp: Date.now) ]
    
    static func insertSampleData(modelContext: ModelContext) {
        for item in Item.sampleItems {
            modelContext.insert(item)
        }
    }
    
    static func reloadSampleData(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: Item.self)
            insertSampleData(modelContext: modelContext)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
