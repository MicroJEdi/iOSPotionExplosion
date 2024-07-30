//
//  Game.swift
//  PotionExplosion
//
//  Created by John Edison on 7/25/24.
//

import Foundation
import SwiftData

class GameContext: ObservableObject {
    
    @Published var numRows: Int
    @Published var numColumns: Int
    @Published var numIngredients: Int
    @Published var numSavedIngredients: Int
    @Published var numIncompletePotions: Int
    @Published var ingredientWidth: CGFloat
    @Published var gameBoardIngredients: [[Ingredient]]
    @Published var selctedGameBoardIngredientRow: Int
    @Published var selctedGameBoardIngredientColumn: Int
    @Published var isIngredientSelected: Bool
    @Published var playerContexts: [PlayerContext]
    @Published var activePlayerIndex: Int
    @Published var applicationUserPlayerInex: Int
    @Published var turn: Turn
    
    init(numRows: Int = 10, numColumns: Int = 5, numIngredients: Int = 100, numSavedIngredients: Int = 3, numIncompletePotions: Int = 2, ingredientWidth: CGFloat = 20.0, selctedGameBoardIngredientRow: Int = -1, selctedGameBoardIngredientColumn: Int = -1, isIngredientSelected: Bool = false, playerContexts: [PlayerContext] = [PlayerContext](), activeTurnPLayerIndex: Int = 0, thisPLayerIndex: Int = 0, turn: Turn = Turn()) {
        self.numRows = numRows
        self.numColumns = numColumns
        self.numIngredients = numIngredients
        self.numSavedIngredients = numSavedIngredients
        self.numIncompletePotions = numIncompletePotions
        self.ingredientWidth = ingredientWidth
        self.selctedGameBoardIngredientRow = selctedGameBoardIngredientRow
        self.selctedGameBoardIngredientColumn = selctedGameBoardIngredientColumn
        self.isIngredientSelected = isIngredientSelected
        self.activePlayerIndex = activeTurnPLayerIndex
        self.applicationUserPlayerInex = thisPLayerIndex
        self.turn = turn
        
        var availableIngredients: [IngredientType] = []
        for x in 0..<IngredientType.allCases.count {
            for _ in 0..<Int(numIngredients/IngredientType.allCases.count) {
                switch x {
                    case 0:
                        availableIngredients.append(IngredientType.red)
                    case 1:
                        availableIngredients.append(IngredientType.blue)
                    case 2:
                        availableIngredients.append(IngredientType.black)
                    case 3:
                        availableIngredients.append(IngredientType.yellow)
                    default:
                        print("Unknown Ingredient Type")
                }
            }
        }
        availableIngredients.shuffle()
        
        self.gameBoardIngredients = (0..<numColumns).map { x in
            (0..<(numIngredients/numColumns)).map { y in
                return Ingredient(ingredientType: availableIngredients.removeFirst())
            }
        }
        
        if playerContexts.count == 0 {
            let newPlayerContexts = [ PlayerContext(name: "User 1"), PlayerContext(name: "User 2"), PlayerContext(name: "User 3"), PlayerContext(name: "User 4") ]
            for playerContext in newPlayerContexts {
                playerContext.incompletePotions = [
                    Potion(potionType: PotionType.activateUsedPotion, numRed: 3, numBlue: 2, numBlack: 0, numYellow: 0),
                    Potion(potionType: PotionType.activateUsedPotion, numRed: 0, numBlue: 2, numBlack: 0, numYellow: 4)
                ]
            }
            self.playerContexts = newPlayerContexts
        }
        else {
            self.playerContexts = playerContexts
        }
        
    }
    
    func BeginPlayerTurn() -> Void {
        self.turn.selectedActionType = ActionType.SelectCascadingIngredient
        self.turn.hasTakenCascadingIngredient = false
        self.turn.hasTakenSingleIngredient = false
        self.playerContexts[self.activePlayerIndex].isActivePlayer = true
    }
    
    func CascasingIngredientSelection(row: Int, column: Int) {
        self.isIngredientSelected = false
    }
    
    func SingleIngredientelection(row: Int, column: Int) {
        self.isIngredientSelected = false
    }
    
    func UsePotion(potion: Potion) {
        switch potion.potionType {
            case PotionType.adjacentColumnDifferentColor:
                print("This")
            case PotionType.adjacentColumnSameColor:
                print("That")
            case PotionType.bottomRowDifferentColor:
                print("The Other")
            default:
                print("Potion Not Found")
        }
    }
    
    func EndPlayerTurn() -> Void {
        self.playerContexts[self.activePlayerIndex].isActivePlayer = false
        self.AdvanceToNextPLayer()
        self.BeginPlayerTurn()
    }
    
    func AdvanceToNextPLayer() -> Void {
        self.activePlayerIndex = ((self.activePlayerIndex+1)%self.playerContexts.count)
    }
    
}

class PlayerContext: ObservableObject, Identifiable {
    
    @Published var name: String
    @Published var isActivePlayer: Bool
    @Published var tokens: [Token]
    @Published var collectedIngredients: [Ingredient]
    @Published var storedIngredients: [Ingredient]
    @Published var incompletePotions: [Potion]
    @Published var unusedCompletePotions: [Potion]
    @Published var usedCompletePotions: [Potion]
    
    func GetUsedPotionTypeCount(potionType: PotionType) -> Int {
        return self.usedCompletePotions.reduce(0, {
            $0 + (($1.potionType == potionType) ? 1 : 0)
        })
    }
    
    func GetUnusedPotionTypeCount(potionType: PotionType) -> Int {
        return self.unusedCompletePotions.reduce(0, {
            $0 + (($1.potionType == potionType) ? 1 : 0)
        })
    }
    
    func GetTotalPotionTypeCount(potionType: PotionType) -> Int {
        return GetUsedPotionTypeCount(potionType: potionType) + GetUnusedPotionTypeCount(potionType: potionType)
    }
    
    init(name: String, isActivePlayer: Bool = false, tokens: [Token] = [Token](), collectedIngredients: [Ingredient] = [Ingredient](), storedIngredients: [Ingredient] = [Ingredient](), incompletePotions: [Potion] = [Potion](), unusedCompletePotions: [Potion] = [Potion](), usedCompletePotions: [Potion] = [Potion]()) {
        self.name = name
        self.isActivePlayer = isActivePlayer
        self.tokens = tokens
        self.collectedIngredients = collectedIngredients
        self.storedIngredients = storedIngredients
        self.incompletePotions = incompletePotions
        self.unusedCompletePotions = unusedCompletePotions
        self.usedCompletePotions = usedCompletePotions
    }
    
}
