//
//  Item.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
