//
//  SampleDataProtocol.swift
//  PotionExplosion
//
//  Created by John Edison on 7/25/24.
//

import Foundation
import SwiftData

protocol PopulateSampleDataProtocol {
    static func insertSampleData(modelContext: ModelContext)
    static func reloadSampleData(modelContext: ModelContext)
}
