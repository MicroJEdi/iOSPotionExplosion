//
//  Potion.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import Foundation
import SwiftUI

enum PotionType: CaseIterable {
    case adjacentColumnDifferentColor
    case bottomRowDifferentColor
    case adjacentColumnSameColor
    case stealOpponentsReserve
    case makeIngredientsWild
    case activateUsedPotion
}

struct Potion: Identifiable, Hashable {
    let id: UUID = UUID()
    var isComplete: Bool = false
    var isUsed: Bool = false
    var potionType: PotionType
    var numRed: Int
    var numBlue: Int
    var numBlack: Int
    var numYellow: Int
    var potionIngredients: [Color:[Ingredient]] = [Color:[Ingredient]]()
    
    init(potionType: PotionType, numRed: Int = 0, numBlue: Int = 0, numBlack: Int = 0, numYellow: Int = 0) {
        self.potionType = potionType
        self.numRed = numRed
        self.numBlue = numBlue
        self.numBlack = numBlack
        self.numYellow = numYellow
    }
    
    static var PotionTypeColorMap: [PotionType: (String, Color)] = PotionType.allCases.reduce(into: [PotionType: (String, Color)]()) { (dict, potionType) in
        switch potionType {
        case PotionType.adjacentColumnDifferentColor:
            dict[potionType] = ("ACD", Color.red)
        case PotionType.bottomRowDifferentColor:
            dict[potionType] = ("BRDC", Color.orange)
        case PotionType.adjacentColumnSameColor:
            dict[potionType] = ("ACSC", Color.yellow)
        case PotionType.stealOpponentsReserve:
            dict[potionType] = ("SOR", Color.green)
        case PotionType.makeIngredientsWild:
            dict[potionType] = ("MIR", Color.blue)
        case PotionType.activateUsedPotion:
            dict[potionType] = ("AUP", Color.purple)
        }
    }
}
