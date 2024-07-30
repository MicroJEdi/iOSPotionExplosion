//
//  Turn.swift
//  PotionExplosion
//
//  Created by John Edison on 7/27/24.
//

import Foundation

enum ActionType: CaseIterable {
    case SelectCascadingIngredient
    case SelectSingleIngredient
    case UsePotion
    case SelectNewPotions
}

struct Turn: Identifiable, Hashable {
    var id: UUID = UUID()
    var selectedActionType: ActionType
    var selectedPotionType: PotionType
    var hasTakenSingleIngredient: Bool
    var hasTakenCascadingIngredient: Bool
    
    init(selectedActionType: ActionType = .SelectCascadingIngredient, selectedPotionType: PotionType = .adjacentColumnDifferentColor, hasTakenIngredientPenalty: Bool = false, hasTakenCascadingIngredient: Bool = false) {
        self.selectedActionType = selectedActionType
        self.selectedPotionType = selectedPotionType
        self.hasTakenSingleIngredient = hasTakenIngredientPenalty
        self.hasTakenCascadingIngredient = hasTakenCascadingIngredient
    }
    
    static var TurnStateStringMap: [ActionType: String] = ActionType.allCases.reduce(into: [ActionType: String]()) { (dict, turnState) in
        switch turnState {
            case ActionType.SelectCascadingIngredient:
                dict[turnState] = "Cascading Ingredients"
            case ActionType.SelectSingleIngredient:
                dict[turnState] = "Single Ingredient"
            case ActionType.UsePotion:
                dict[turnState] = "Use Potion"
            case ActionType.SelectNewPotions:
                dict[turnState] = "New Potion"
        }
    }
}
