//
//  Game.swift
//  PotionExplosion
//
//  Created by John Edison on 7/25/24.
//

import Foundation
import SwiftData

class AppContext: ObservableObject {
    var gameContext: GameContext
    
    init() {
        self.gameContext = GameContext()
    }
    
    init(gameState: GameContext) {
        self.gameContext = gameState
    }
}

class GameContext: ObservableObject {
    @Published var gameBoardContext: GameBoardContext
    @Published var playersContext: PlayersContext
    
    init(gameBoardContext: GameBoardContext = GameBoardContext(), playersContext: PlayersContext = PlayersContext()) {
        self.gameBoardContext = gameBoardContext
        self.playersContext = playersContext
    }
}

class GameBoardContext: ObservableObject {
    @Published var numRows: Int
    @Published var numColumns: Int
    @Published var numIngredients: Int
    @Published var ingredients: [[Ingredient]]
    
    init(numRows: Int = 10, numColumns: Int = 5, numIngredients: Int = 80) {
        self.numRows = numRows
        self.numColumns = numColumns
        self.numIngredients = numIngredients
        
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
        
        self.ingredients = (0..<numColumns).map { x in
            (0..<(numIngredients/numColumns)).map { y in
                return Ingredient(row: y, column: x, ingredientType: availableIngredients.removeFirst())
            }
        }
    }
}

class PlayersContext: ObservableObject {
    @Published var playerContexts: [PlayerContext]
    @Published var activeTurnPlayerIndex: Int
    @Published var thisPlayerInex: Int
    
    init(playerContexts: [PlayerContext] = [PlayerContext](), activeTurnPLayerIndex: Int = 0, thisPLayerIndex: Int = 0) {
        
        if playerContexts.count == 0 {
            var newPlayer = PlayerContext()
            newPlayer.incompletePotions = [
                Potion(potionType: PotionType.activateUsedPotion, numRed: 3, numBlue: 2, numBlack: 0, numYellow: 0),
                Potion(potionType: PotionType.activateUsedPotion, numRed: 0, numBlue: 2, numBlack: 0, numYellow: 4)
            ]
            self.playerContexts = [ newPlayer ]
        }
        else {
            self.playerContexts = playerContexts
        }
        self.activeTurnPlayerIndex = activeTurnPLayerIndex
        self.thisPlayerInex = thisPLayerIndex
    }
}

class PlayerContext: ObservableObject {
    @Published var tokens: [Token]
    @Published var collectedIngredients: [Ingredient]
    @Published var storedIngredients: [Ingredient]
    @Published var incompletePotions: [Potion]
    @Published var unusedCompletePotions: [Potion]
    @Published var usedCompletePotions: [Potion]
    
    init(tokens: [Token] = [Token](), collectedIngredients: [Ingredient] = [Ingredient](), storedIngredients: [Ingredient] = [Ingredient](), incompletePotions: [Potion] = [Potion](), unusedCompletePotions: [Potion] = [Potion](), usedCompletePotions: [Potion] = [Potion]()) {
        self.tokens = tokens
        self.collectedIngredients = collectedIngredients
        self.storedIngredients = storedIngredients
        self.incompletePotions = incompletePotions
        self.unusedCompletePotions = unusedCompletePotions
        self.usedCompletePotions = usedCompletePotions
    }
}
