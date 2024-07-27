//
//  PlayerArea.swift
//  PotionExplosion
//
//  Created by John Edison on 7/24/24.
//

import SwiftUI
import SwiftData

struct ActiveTurnPlayerArea: View {
    
    let ingredientWidth = 12.0
    
    @EnvironmentObject var state: PlayersContext
    
    func GetActiveTurnPlayerContext() -> PlayerContext {
        return self.state.playerContexts[self.state.activeTurnPlayerIndex]
    }
    
    func GetIngredientTypeCount(ingredientType: IngredientType) -> Int {
        return GetActiveTurnPlayerContext().collectedIngredients.reduce(0, {
            $0 + (($1.ingredientType == ingredientType) ? 1 : 0)
        })
    }

    var body: some View {
        VStack {
            HStack {
                IngredientPool(state: GetActiveTurnPlayerContext())
                    .scaledToFit()
                SavedIngredients(state: GetActiveTurnPlayerContext(), numIngredients: 3, color: Color.purple, ingredientWidth: ingredientWidth)
                    .scaledToFit()
                IncompletePotions(state: GetActiveTurnPlayerContext(), ingredientWidth: ingredientWidth)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            CompletedPotions()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview("Default") {
    ModelContainerPreview(ModelContainer.sample) {
        ContentView()
    }
}
