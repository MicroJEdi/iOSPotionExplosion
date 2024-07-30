//
//  Ingredient.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import Foundation
import SwiftUI

enum IngredientType: CaseIterable {
    case red
    case yellow
    case blue
    case black
}


struct Ingredient: Identifiable, Hashable {
    let id: UUID = UUID()
    var ingredientType: IngredientType
    
    var color: Color {
        return Ingredient.IngredientTypeColorMap[self.ingredientType] ?? Color.purple
    }
    
    init(ingredientType: IngredientType) {
        self.ingredientType = ingredientType
    }
    
    static var IngredientTypeColorMap: [IngredientType: Color] = IngredientType.allCases.reduce(into: [IngredientType: Color]()) { (dict, ingredientType) in
        switch ingredientType {
            case IngredientType.red:
                dict[IngredientType.red] = Color.red
            case IngredientType.blue:
                dict[IngredientType.blue] = Color.blue
            case IngredientType.black:
                dict[IngredientType.black] = Color.black
            case IngredientType.yellow:
                dict[IngredientType.yellow] = Color.yellow
        }
    }
}
