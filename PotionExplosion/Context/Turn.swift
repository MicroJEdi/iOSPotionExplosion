//
//  Turn.swift
//  PotionExplosion
//
//  Created by John Edison on 7/27/24.
//

import Foundation

enum TurnState {
    case BeginTurn
    case SelectIngredients
    case SelectNewPotions
    case EndTurn
}

struct Turn: Identifiable, Hashable {
    var id: UUID = UUID()
    var turnState: TurnState
    var hasTakenIngredientPenalty: Bool
    var hasTakenCascadingIngredient: Bool
    
    init(turnState: TurnState = .BeginTurn, hasTakenIngredientPenalty: Bool = false, hasTakenCascadingIngredient: Bool = false) {
        self.turnState = turnState
        self.hasTakenIngredientPenalty = hasTakenIngredientPenalty
        self.hasTakenCascadingIngredient = hasTakenCascadingIngredient
    }
}
